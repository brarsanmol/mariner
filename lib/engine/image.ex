defmodule Engine.Image do
  @moduledoc """
  Provides API endpoints related to image
  """

  @default_client Engine.Client

  @type build_prune_200_json_resp :: %{
          CachesDeleted: [String.t()] | nil,
          SpaceReclaimed: integer | nil
        }

  @doc """
  Delete builder cache

  ## Options

    * `keep-storage`: Amount of disk space in bytes to keep for cache
    * `all`: Remove all types of build cache
    * `filters`: A JSON encoded value of the filters (a `map[string][]string`) to
      process on the list of build cache objects.
      
      Available filters:
      
      - `until=<timestamp>` remove cache older than `<timestamp>`. The `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon's local time.
      - `id=<id>`
      - `parent=<id>`
      - `type=<string>`
      - `description=<string>`
      - `inuse`
      - `shared`
      - `private`
      

  """
  @spec build_prune(keyword) :: {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def build_prune(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:all, :filters, :"keep-storage"])

    client.request(%{
      args: [],
      call: {Engine.Image, :build_prune},
      url: "/build/prune",
      method: :post,
      query: query,
      response: [
        {200, {Engine.Image, :build_prune_200_json_resp}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Build an image

  Build an image from a tar archive with a `Dockerfile` in it.

  The `Dockerfile` specifies how the image is built from the tar archive. It is typically in the archive's root, but can be at a different path or have a different name by specifying the `dockerfile` parameter. [See the `Dockerfile` reference for more information](https://docs.docker.com/engine/reference/builder/).

  The Docker daemon performs a preliminary validation of the `Dockerfile` before starting the build, and returns an error if the syntax is incorrect. After that, each instruction is run one-by-one until the ID of the new image is output.

  The build is canceled if the client drops the connection by quitting or being killed.


  ## Options

    * `dockerfile`: Path within the build context to the `Dockerfile`. This is ignored if `remote` is specified and points to an external `Dockerfile`.
    * `t`: A name and optional tag to apply to the image in the `name:tag` format. If you omit the tag the default `latest` value is assumed. You can provide several `t` parameters.
    * `extrahosts`: Extra hosts to add to /etc/hosts
    * `remote`: A Git repository URI or HTTP/HTTPS context URI. If the URI points to a single text file, the file’s contents are placed into a file called `Dockerfile` and the image is built from that file. If the URI points to a tarball, the file is downloaded by the daemon and the contents therein used as the context for the build. If the URI points to a tarball and the `dockerfile` parameter is also specified, there must be a file with the corresponding path inside the tarball.
    * `q`: Suppress verbose build output.
    * `nocache`: Do not use the cache when building the image.
    * `cachefrom`: JSON array of images used for build cache resolution.
    * `pull`: Attempt to pull the image even if an older image exists locally.
    * `rm`: Remove intermediate containers after a successful build.
    * `forcerm`: Always remove intermediate containers, even upon failure.
    * `memory`: Set memory limit for build.
    * `memswap`: Total memory (memory + swap). Set as `-1` to disable swap.
    * `cpushares`: CPU shares (relative weight).
    * `cpusetcpus`: CPUs in which to allow execution (e.g., `0-3`, `0,1`).
    * `cpuperiod`: The length of a CPU period in microseconds.
    * `cpuquota`: Microseconds of CPU time that the container can get in a CPU period.
    * `buildargs`: JSON map of string pairs for build-time variables. Users pass these values at build-time. Docker uses the buildargs as the environment context for commands run via the `Dockerfile` RUN instruction, or for variable expansion in other `Dockerfile` instructions. This is not meant for passing secret values.
      
      For example, the build arg `FOO=bar` would become `{"FOO":"bar"}` in JSON. This would result in the query parameter `buildargs={"FOO":"bar"}`. Note that `{"FOO":"bar"}` should be URI component encoded.
      
      [Read more about the buildargs instruction.](https://docs.docker.com/engine/reference/builder/#arg)
      
    * `shmsize`: Size of `/dev/shm` in bytes. The size must be greater than 0. If omitted the system uses 64MB.
    * `squash`: Squash the resulting images layers into a single layer. *(Experimental release only.)*
    * `labels`: Arbitrary key/value labels to set on the image, as a JSON map of string pairs.
    * `networkmode`: Sets the networking mode for the run commands during build. Supported
      standard values are: `bridge`, `host`, `none`, and `container:<name|id>`.
      Any other value is taken as a custom network's name or ID to which this
      container should connect to.
      
    * `platform`: Platform in the format os[/arch[/variant]]
    * `target`: Target build stage
    * `outputs`: BuildKit output configuration
    * `version`: Version of the builder backend to use.
      
      - `1` is the first generation classic (deprecated) builder in the Docker daemon (default)
      - `2` is [BuildKit](https://github.com/moby/buildkit)
      

  """
  @spec image_build(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def image_build(body, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :buildargs,
        :cachefrom,
        :cpuperiod,
        :cpuquota,
        :cpusetcpus,
        :cpushares,
        :dockerfile,
        :extrahosts,
        :forcerm,
        :labels,
        :memory,
        :memswap,
        :networkmode,
        :nocache,
        :outputs,
        :platform,
        :pull,
        :q,
        :remote,
        :rm,
        :shmsize,
        :squash,
        :t,
        :target,
        :version
      ])

    client.request(%{
      args: [body: body],
      call: {Engine.Image, :image_build},
      url: "/build",
      body: body,
      method: :post,
      query: query,
      request: [{"application/octet-stream", {:string, :generic}}],
      response: [
        {200, :null},
        {400, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a new image from a container

  ## Options

    * `container`: The ID or name of the container to commit
    * `repo`: Repository name for the created image
    * `tag`: Tag name for the create image
    * `comment`: Commit message
    * `author`: Author of the image (e.g., `John Hannibal Smith <hannibal@a-team.com>`)
    * `pause`: Whether to pause the container before committing
    * `changes`: `Dockerfile` instructions to apply while committing

  """
  @spec image_commit(Engine.ContainerConfig.t(), keyword) ::
          {:ok, Engine.IdResponse.t()} | {:error, Engine.ErrorResponse.t()}
  def image_commit(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:author, :changes, :comment, :container, :pause, :repo, :tag])

    client.request(%{
      args: [body: body],
      call: {Engine.Image, :image_commit},
      url: "/commit",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Engine.ContainerConfig, :t}}],
      response: [
        {201, {Engine.IdResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create an image

  Pull or import an image.

  ## Options

    * `fromImage`: Name of the image to pull. The name may include a tag or digest. This parameter may only be used when pulling an image. The pull is cancelled if the HTTP connection is closed.
    * `fromSrc`: Source to import. The value may be a URL from which the image can be retrieved or `-` to read the image from the request body. This parameter may only be used when importing an image.
    * `repo`: Repository name given to an image when it is imported. The repo may include a tag. This parameter may only be used when importing an image.
    * `tag`: Tag or digest. If empty when pulling an image, this causes all tags for the given image to be pulled.
    * `message`: Set commit message for imported image.
    * `changes`: Apply `Dockerfile` instructions to the image that is created,
      for example: `changes=ENV DEBUG=true`.
      Note that `ENV DEBUG=true` should be URI component encoded.
      
      Supported `Dockerfile` instructions:
      `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
      
    * `platform`: Platform in the format os[/arch[/variant]].
      
      When used in combination with the `fromImage` option, the daemon checks
      if the given image is present in the local image cache with the given
      OS and Architecture, and otherwise attempts to pull the image. If the
      option is not set, the host's native OS and Architecture are used.
      If the given image does not exist in the local image cache, the daemon
      attempts to pull the image with the host's native OS and Architecture.
      If the given image does exists in the local image cache, but its OS or
      architecture does not match, a warning is produced.
      
      When used with the `fromSrc` option to import an image from an archive,
      this option sets the platform information for the imported image. If
      the option is not set, the host's native OS and Architecture are used
      for the imported image.
      

  """
  @spec image_create(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def image_create(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:changes, :fromImage, :fromSrc, :message, :platform, :repo, :tag])

    client.request(%{
      args: [body: body],
      call: {Engine.Image, :image_create},
      url: "/images/create",
      body: body,
      method: :post,
      query: query,
      request: [
        {"application/octet-stream", {:string, :generic}},
        {"text/plain", {:string, :generic}}
      ],
      response: [
        {200, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove an image

  Remove an image, along with any untagged parent images that were
  referenced by that image.

  Images can't be removed if they have descendant images, are being
  used by a running container or are being used by a build.


  ## Options

    * `force`: Remove the image even if it is being used by stopped containers or has other tags
    * `noprune`: Do not delete untagged parent images

  """
  @spec image_delete(String.t(), keyword) ::
          {:ok, [Engine.ImageDeleteResponseItem.t()]} | {:error, Engine.ErrorResponse.t()}
  def image_delete(name, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:force, :noprune])

    client.request(%{
      args: [name: name],
      call: {Engine.Image, :image_delete},
      url: "/images/#{name}",
      method: :delete,
      query: query,
      response: [
        {200, [{Engine.ImageDeleteResponseItem, :t}]},
        {404, {Engine.ErrorResponse, :t}},
        {409, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Export an image

  Get a tarball containing all images and metadata for a repository.

  If `name` is a specific name and tag (e.g. `ubuntu:latest`), then only that image (and its parents) are returned. If `name` is an image ID, similarly only that image (and its parents) are returned, but with the exclusion of the `repositories` file in the tarball, as there were no image names referenced.

  ### Image tarball format

  An image tarball contains one directory per image layer (named using its long ID), each containing these files:

  - `VERSION`: currently `1.0` - the file format version
  - `json`: detailed layer information, similar to `docker inspect layer_id`
  - `layer.tar`: A tarfile containing the filesystem changes in this layer

  The `layer.tar` file contains `aufs` style `.wh..wh.aufs` files and directories for storing attribute changes and deletions.

  If the tarball defines a repository, the tarball should also include a `repositories` file at the root that contains a list of repository and tag names mapped to layer IDs.

  ```json
  {
    "hello-world": {
      "latest": "565a9d68a73f6706862bfe8409a7f659776d4d60a8d096eb4a3cbce6999cc2a1"
    }
  }
  ```

  """
  @spec image_get(String.t(), keyword) :: {:ok, String.t()} | {:error, Engine.ErrorResponse.t()}
  def image_get(name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name],
      call: {Engine.Image, :image_get},
      url: "/images/#{name}/get",
      method: :get,
      response: [{200, {:string, :generic}}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Export several images

  Get a tarball containing all images and metadata for several image
  repositories.

  For each value of the `names` parameter: if it is a specific name and
  tag (e.g. `ubuntu:latest`), then only that image (and its parents) are
  returned; if it is an image ID, similarly only that image (and its parents)
  are returned and there would be no names referenced in the 'repositories'
  file for this image ID.

  For details on the format, see the [export image endpoint](#operation/ImageGet).


  ## Options

    * `names`: Image names to filter by

  """
  @spec image_get_all(keyword) :: {:ok, String.t()} | {:error, Engine.ErrorResponse.t()}
  def image_get_all(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:names])

    client.request(%{
      args: [],
      call: {Engine.Image, :image_get_all},
      url: "/images/get",
      method: :get,
      query: query,
      response: [{200, {:string, :generic}}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type image_history_200_json_resp :: %{
          Comment: String.t(),
          Created: integer,
          CreatedBy: String.t(),
          Id: String.t(),
          Size: integer,
          Tags: [String.t()]
        }

  @doc """
  Get the history of an image

  Return parent layers of an image.
  """
  @spec image_history(String.t(), keyword) :: {:ok, [map]} | {:error, Engine.ErrorResponse.t()}
  def image_history(name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name],
      call: {Engine.Image, :image_history},
      url: "/images/#{name}/history",
      method: :get,
      response: [
        {200, [{Engine.Image, :image_history_200_json_resp}]},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Inspect an image

  Return low-level information about an image.
  """
  @spec image_inspect(String.t(), keyword) ::
          {:ok, Engine.ImageInspect.t()} | {:error, Engine.ErrorResponse.t()}
  def image_inspect(name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name],
      call: {Engine.Image, :image_inspect},
      url: "/images/#{name}/json",
      method: :get,
      response: [
        {200, {Engine.ImageInspect, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Images

  Returns a list of images on the server. Note that it uses a different, smaller representation of an image than inspecting a single image.

  ## Options

    * `all`: Show all images. Only images from a final layer (no children) are shown by default.
    * `filters`: A JSON encoded value of the filters (a `map[string][]string`) to
      process on the images list.
      
      Available filters:
      
      - `before`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
      - `dangling=true`
      - `label=key` or `label="key=value"` of an image label
      - `reference`=(`<image-name>[:<tag>]`)
      - `since`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
      - `until=<timestamp>`
      
    * `shared-size`: Compute and show shared size as a `SharedSize` field on each image.
    * `digests`: Show digest information as a `RepoDigests` field on each image.
    * `manifests`: Include `Manifests` in the image summary.

  """
  @spec image_list(keyword) ::
          {:ok, [Engine.ImageSummary.t()]} | {:error, Engine.ErrorResponse.t()}
  def image_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:all, :digests, :filters, :manifests, :"shared-size"])

    client.request(%{
      args: [],
      call: {Engine.Image, :image_list},
      url: "/images/json",
      method: :get,
      query: query,
      response: [{200, [{Engine.ImageSummary, :t}]}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Import images

  Load a set of images and tags into a repository.

  For details on the format, see the [export image endpoint](#operation/ImageGet).


  ## Options

    * `quiet`: Suppress progress details during load.

  """
  @spec image_load(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def image_load(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:quiet])

    client.request(%{
      args: [body: body],
      call: {Engine.Image, :image_load},
      url: "/images/load",
      body: body,
      method: :post,
      query: query,
      request: [{"application/x-tar", {:string, :generic}}],
      response: [{200, :null}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type image_prune_200_json_resp :: %{
          ImagesDeleted: [Engine.ImageDeleteResponseItem.t()] | nil,
          SpaceReclaimed: integer | nil
        }

  @doc """
  Delete unused images

  ## Options

    * `filters`: Filters to process on the prune list, encoded as JSON (a `map[string][]string`). Available filters:
      
      - `dangling=<boolean>` When set to `true` (or `1`), prune only
         unused *and* untagged images. When set to `false`
         (or `0`), all unused images are pruned.
      - `until=<string>` Prune images created before this timestamp. The `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon machine’s time.
      - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune images with (or without, in case `label!=...` is used) the specified labels.
      

  """
  @spec image_prune(keyword) :: {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def image_prune(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters])

    client.request(%{
      args: [],
      call: {Engine.Image, :image_prune},
      url: "/images/prune",
      method: :post,
      query: query,
      response: [
        {200, {Engine.Image, :image_prune_200_json_resp}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Push an image

  Push an image to a registry.

  If you wish to push an image on to a private registry, that image must
  already have a tag which references the registry. For example,
  `registry.example.com/myimage:latest`.

  The push is cancelled if the HTTP connection is closed.


  ## Options

    * `tag`: The tag to associate with the image on the registry.
    * `platform`: Select a platform-specific manifest to be pushed. OCI platform (JSON encoded)

  """
  @spec image_push(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def image_push(name, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:platform, :tag])

    client.request(%{
      args: [name: name],
      call: {Engine.Image, :image_push},
      url: "/images/#{name}/push",
      method: :post,
      query: query,
      response: [
        {200, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type image_search_200_json_resp :: %{
          description: String.t() | nil,
          is_automated: boolean | nil,
          is_official: boolean | nil,
          name: String.t() | nil,
          star_count: integer | nil
        }

  @doc """
  Search images

  Search for an image on Docker Hub.

  ## Options

    * `term`: Term to search
    * `limit`: Maximum number of results to return
    * `filters`: A JSON encoded value of the filters (a `map[string][]string`) to process on the images list. Available filters:
      
      - `is-official=(true|false)`
      - `stars=<number>` Matches images that has at least 'number' stars.
      

  """
  @spec image_search(keyword) :: {:ok, [map]} | {:error, Engine.ErrorResponse.t()}
  def image_search(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters, :limit, :term])

    client.request(%{
      args: [],
      call: {Engine.Image, :image_search},
      url: "/images/search",
      method: :get,
      query: query,
      response: [
        {200, [{Engine.Image, :image_search_200_json_resp}]},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Tag an image

  Tag an image so that it becomes part of a repository.

  ## Options

    * `repo`: The repository to tag in. For example, `someuser/someimage`.
    * `tag`: The name of the new tag.

  """
  @spec image_tag(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def image_tag(name, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:repo, :tag])

    client.request(%{
      args: [name: name],
      call: {Engine.Image, :image_tag},
      url: "/images/#{name}/tag",
      method: :post,
      query: query,
      response: [
        {201, :null},
        {400, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {409, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:build_prune_200_json_resp) do
    [CachesDeleted: [string: :generic], SpaceReclaimed: :integer]
  end

  def __fields__(:image_history_200_json_resp) do
    [
      Comment: {:string, :generic},
      Created: :integer,
      CreatedBy: {:string, :generic},
      Id: {:string, :generic},
      Size: :integer,
      Tags: [string: :generic]
    ]
  end

  def __fields__(:image_prune_200_json_resp) do
    [ImagesDeleted: [{Engine.ImageDeleteResponseItem, :t}], SpaceReclaimed: :integer]
  end

  def __fields__(:image_search_200_json_resp) do
    [
      description: {:string, :generic},
      is_automated: :boolean,
      is_official: :boolean,
      name: {:string, :generic},
      star_count: :integer
    ]
  end
end
