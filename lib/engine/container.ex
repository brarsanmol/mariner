defmodule Engine.Container do
  @moduledoc """
  Provides API endpoints related to container
  """

  @default_client Engine.Client

  @doc """
  Get an archive of a filesystem resource in a container

  Get a tar archive of a resource in the filesystem of container id.

  ## Options

    * `path`: Resource in the container’s filesystem to archive.

  """
  @spec container_archive(String.t(), keyword) :: :ok | {:error, any | Engine.ErrorResponse.t()}
  def container_archive(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:path])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_archive},
      url: "/containers/#{id}/archive",
      method: :get,
      query: query,
      response: [
        {200, :null},
        {400, {Engine.ErrorResponse, :t}},
        {404, {:union, [:unknown, {Engine.ErrorResponse, :t}]}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get information about files in a container

  A response header `X-Docker-Container-Path-Stat` is returned, containing
  a base64 - encoded JSON object with some filesystem header information
  about the path.


  ## Options

    * `path`: Resource in the container’s filesystem to archive.

  """
  @spec container_archive_info(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def container_archive_info(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:path])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_archive_info},
      url: "/containers/#{id}/archive",
      method: :head,
      query: query,
      response: [
        {200, :null},
        {400, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Attach to a container

  Attach to a container to read its output or send it input. You can attach
  to the same container multiple times and you can reattach to containers
  that have been detached.

  Either the `stream` or `logs` parameter must be `true` for this endpoint
  to do anything.

  See the [documentation for the `docker attach` command](https://docs.docker.com/engine/reference/commandline/attach/)
  for more details.

  ### Hijacking

  This endpoint hijacks the HTTP connection to transport `stdin`, `stdout`,
  and `stderr` on the same socket.

  This is the response from the daemon for an attach request:

  ```
  HTTP/1.1 200 OK
  Content-Type: application/vnd.docker.raw-stream

  [STREAM]
  ```

  After the headers and two new lines, the TCP connection can now be used
  for raw, bidirectional communication between the client and server.

  To hint potential proxies about connection hijacking, the Docker client
  can also optionally send connection upgrade headers.

  For example, the client sends this request to upgrade the connection:

  ```
  POST /containers/16253994b7c4/attach?stream=1&stdout=1 HTTP/1.1
  Upgrade: tcp
  Connection: Upgrade
  ```

  The Docker daemon will respond with a `101 UPGRADED` response, and will
  similarly follow with the raw stream:

  ```
  HTTP/1.1 101 UPGRADED
  Content-Type: application/vnd.docker.raw-stream
  Connection: Upgrade
  Upgrade: tcp

  [STREAM]
  ```

  ### Stream format

  When the TTY setting is disabled in [`POST /containers/create`](#operation/ContainerCreate),
  the HTTP Content-Type header is set to application/vnd.docker.multiplexed-stream
  and the stream over the hijacked connected is multiplexed to separate out
  `stdout` and `stderr`. The stream consists of a series of frames, each
  containing a header and a payload.

  The header contains the information which the stream writes (`stdout` or
  `stderr`). It also contains the size of the associated frame encoded in
  the last four bytes (`uint32`).

  It is encoded on the first eight bytes like this:

  ```go
  header := [8]byte{STREAM_TYPE, 0, 0, 0, SIZE1, SIZE2, SIZE3, SIZE4}
  ```

  `STREAM_TYPE` can be:

  - 0: `stdin` (is written on `stdout`)
  - 1: `stdout`
  - 2: `stderr`

  `SIZE1, SIZE2, SIZE3, SIZE4` are the four bytes of the `uint32` size
  encoded as big endian.

  Following the header is the payload, which is the specified number of
  bytes of `STREAM_TYPE`.

  The simplest way to implement this protocol is the following:

  1. Read 8 bytes.
  2. Choose `stdout` or `stderr` depending on the first byte.
  3. Extract the frame size from the last four bytes.
  4. Read the extracted size and output it on the correct output.
  5. Goto 1.

  ### Stream format when using a TTY

  When the TTY setting is enabled in [`POST /containers/create`](#operation/ContainerCreate),
  the stream is not multiplexed. The data exchanged over the hijacked
  connection is simply the raw data from the process PTY and client's
  `stdin`.


  ## Options

    * `detachKeys`: Override the key sequence for detaching a container.Format is a single
      character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`,
      `@`, `^`, `[`, `,` or `_`.
      
    * `logs`: Replay previous logs from the container.
      
      This is useful for attaching to a container that has started and you
      want to output everything since the container started.
      
      If `stream` is also enabled, once all the previous output has been
      returned, it will seamlessly transition into streaming current
      output.
      
    * `stream`: Stream attached streams from the time the request was made onwards.
      
    * `stdin`: Attach to `stdin`
    * `stdout`: Attach to `stdout`
    * `stderr`: Attach to `stderr`

  """
  @spec container_attach(String.t(), keyword) :: :ok | {:error, any | Engine.ErrorResponse.t()}
  def container_attach(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:detachKeys, :logs, :stderr, :stdin, :stdout, :stream])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_attach},
      url: "/containers/#{id}/attach",
      method: :post,
      query: query,
      response: [
        {101, :null},
        {200, :null},
        {400, {Engine.ErrorResponse, :t}},
        {404, {:union, [:unknown, {Engine.ErrorResponse, :t}]}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Attach to a container via a websocket

  ## Options

    * `detachKeys`: Override the key sequence for detaching a container.Format is a single
      character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`,
      `@`, `^`, `[`, `,`, or `_`.
      
    * `logs`: Return logs
    * `stream`: Return stream
    * `stdin`: Attach to `stdin`
    * `stdout`: Attach to `stdout`
    * `stderr`: Attach to `stderr`

  """
  @spec container_attach_websocket(String.t(), keyword) ::
          :ok | {:error, Engine.ErrorResponse.t()}
  def container_attach_websocket(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:detachKeys, :logs, :stderr, :stdin, :stdout, :stream])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_attach_websocket},
      url: "/containers/#{id}/attach/ws",
      method: :get,
      query: query,
      response: [
        {101, :null},
        {200, :null},
        {400, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get changes on a container’s filesystem

  Returns which files in a container's filesystem have been added, deleted,
  or modified. The `Kind` of modification can be one of:

  - `0`: Modified ("C")
  - `1`: Added ("A")
  - `2`: Deleted ("D")

  """
  @spec container_changes(String.t(), keyword) ::
          {:ok, [Engine.FilesystemChange.t()]} | {:error, Engine.ErrorResponse.t()}
  def container_changes(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_changes},
      url: "/containers/#{id}/changes",
      method: :get,
      response: [
        {200, [{Engine.FilesystemChange, :t}]},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a container

  ## Options

    * `name`: Assign the specified name to the container. Must match
      `/?[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
      
    * `platform`: Platform in the format `os[/arch[/variant]]` used for image lookup.
      
      When specified, the daemon checks if the requested image is present
      in the local image cache with the given OS and Architecture, and
      otherwise returns a `404` status.
      
      If the option is not set, the host's native OS and Architecture are
      used to look up the image in the image cache. However, if no platform
      is passed and the given image does exist in the local image cache,
      but its OS or architecture does not match, the container is created
      with the available image, and a warning is added to the `Warnings`
      field in the response, for example;
      
          WARNING: The requested image's platform (linux/arm64/v8) does not
                   match the detected host platform (linux/amd64) and no
                   specific platform was requested
      

  """
  @spec container_create(map, keyword) ::
          {:ok, Engine.ContainerCreateResponse.t()} | {:error, Engine.ErrorResponse.t()}
  def container_create(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:name, :platform])

    client.request(%{
      args: [body: body],
      call: {Engine.Container, :container_create},
      url: "/containers/create",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}, {"application/octet-stream", :map}],
      response: [
        {201, {Engine.ContainerCreateResponse, :t}},
        {400, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {409, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove a container

  ## Options

    * `v`: Remove anonymous volumes associated with the container.
    * `force`: If the container is running, kill it before removing it.
    * `link`: Remove the specified link associated with the container.

  """
  @spec container_delete(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def container_delete(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:force, :link, :v])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_delete},
      url: "/containers/#{id}",
      method: :delete,
      query: query,
      response: [
        {204, :null},
        {400, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {409, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Export a container

  Export the contents of a container as a tarball.
  """
  @spec container_export(String.t(), keyword) :: :ok | {:error, any | Engine.ErrorResponse.t()}
  def container_export(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_export},
      url: "/containers/#{id}/export",
      method: :get,
      response: [
        {200, :null},
        {404, {:union, [:unknown, {Engine.ErrorResponse, :t}]}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type container_inspect_200_json_resp :: %{
          AppArmorProfile: String.t() | nil,
          Args: [String.t()] | nil,
          Config: Engine.ContainerConfig.t() | nil,
          Created: String.t() | nil,
          Driver: String.t() | nil,
          ExecIDs: [String.t()] | nil,
          GraphDriver: Engine.DriverData.t() | nil,
          HostConfig: Engine.HostConfig.t() | nil,
          HostnamePath: String.t() | nil,
          HostsPath: String.t() | nil,
          Id: String.t() | nil,
          Image: String.t() | nil,
          LogPath: String.t() | nil,
          MountLabel: String.t() | nil,
          Mounts: [Engine.MountPoint.t()] | nil,
          Name: String.t() | nil,
          NetworkSettings: Engine.NetworkSettings.t() | nil,
          Path: String.t() | nil,
          Platform: String.t() | nil,
          ProcessLabel: String.t() | nil,
          ResolvConfPath: String.t() | nil,
          RestartCount: integer | nil,
          SizeRootFs: integer | nil,
          SizeRw: integer | nil,
          State: Engine.ContainerState.t() | nil
        }

  @doc """
  Inspect a container

  Return low-level information about a container.

  ## Options

    * `size`: Return the size of container as fields `SizeRw` and `SizeRootFs`

  """
  @spec container_inspect(String.t(), keyword) :: {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def container_inspect(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:size])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_inspect},
      url: "/containers/#{id}/json",
      method: :get,
      query: query,
      response: [
        {200, {Engine.Container, :container_inspect_200_json_resp}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Kill a container

  Send a POSIX signal to a container, defaulting to killing to the
  container.


  ## Options

    * `signal`: Signal to send to the container as an integer or string (e.g. `SIGINT`).
      

  """
  @spec container_kill(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def container_kill(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:signal])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_kill},
      url: "/containers/#{id}/kill",
      method: :post,
      query: query,
      response: [
        {204, :null},
        {404, {Engine.ErrorResponse, :t}},
        {409, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List containers

  Returns a list of containers. For details on the format, see the
  [inspect endpoint](#operation/ContainerInspect).

  Note that it uses a different, smaller representation of a container
  than inspecting a single container. For example, the list of linked
  containers is not propagated .


  ## Options

    * `all`: Return all containers. By default, only running containers are shown.
      
    * `limit`: Return this number of most recently created containers, including
      non-running ones.
      
    * `size`: Return the size of container as fields `SizeRw` and `SizeRootFs`.
      
    * `filters`: Filters to process on the container list, encoded as JSON (a
      `map[string][]string`). For example, `{"status": ["paused"]}` will
      only return paused containers.
      
      Available filters:
      
      - `ancestor`=(`<image-name>[:<tag>]`, `<image id>`, or `<image@digest>`)
      - `before`=(`<container id>` or `<container name>`)
      - `expose`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
      - `exited=<int>` containers with exit code of `<int>`
      - `health`=(`starting`|`healthy`|`unhealthy`|`none`)
      - `id=<ID>` a container's ID
      - `isolation=`(`default`|`process`|`hyperv`) (Windows daemon only)
      - `is-task=`(`true`|`false`)
      - `label=key` or `label="key=value"` of a container label
      - `name=<name>` a container's name
      - `network`=(`<network id>` or `<network name>`)
      - `publish`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
      - `since`=(`<container id>` or `<container name>`)
      - `status=`(`created`|`restarting`|`running`|`removing`|`paused`|`exited`|`dead`)
      - `volume`=(`<volume name>` or `<mount point destination>`)
      

  """
  @spec container_list(keyword) ::
          {:ok, [Engine.ContainerSummary.t()]} | {:error, Engine.ErrorResponse.t()}
  def container_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:all, :filters, :limit, :size])

    client.request(%{
      args: [],
      call: {Engine.Container, :container_list},
      url: "/containers/json",
      method: :get,
      query: query,
      response: [
        {200, [{Engine.ContainerSummary, :t}]},
        {400, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get container logs

  Get `stdout` and `stderr` logs from a container.

  Note: This endpoint works only for containers with the `json-file` or
  `journald` logging driver.


  ## Options

    * `follow`: Keep connection after returning logs.
    * `stdout`: Return logs from `stdout`
    * `stderr`: Return logs from `stderr`
    * `since`: Only return logs since this time, as a UNIX timestamp
    * `until`: Only return logs before this time, as a UNIX timestamp
    * `timestamps`: Add timestamps to every log line
    * `tail`: Only return this number of log lines from the end of the logs.
      Specify as an integer or `all` to output all log lines.
      

  """
  @spec container_logs(String.t(), keyword) ::
          {:ok, String.t()} | {:error, any | Engine.ErrorResponse.t()}
  def container_logs(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:follow, :since, :stderr, :stdout, :tail, :timestamps, :until])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_logs},
      url: "/containers/#{id}/logs",
      method: :get,
      query: query,
      response: [
        {200, {:string, :generic}},
        {404, {:union, [:unknown, {Engine.ErrorResponse, :t}]}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Pause a container

  Use the freezer cgroup to suspend all processes in a container.

  Traditionally, when suspending a process the `SIGSTOP` signal is used,
  which is observable by the process being suspended. With the freezer
  cgroup the process is unaware, and unable to capture, that it is being
  suspended, and subsequently resumed.

  """
  @spec container_pause(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def container_pause(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_pause},
      url: "/containers/#{id}/pause",
      method: :post,
      response: [
        {204, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type container_prune_200_json_resp :: %{
          ContainersDeleted: [String.t()] | nil,
          SpaceReclaimed: integer | nil
        }

  @doc """
  Delete stopped containers

  ## Options

    * `filters`: Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      
      Available filters:
      - `until=<timestamp>` Prune containers created before this timestamp. The `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon machine’s time.
      - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune containers with (or without, in case `label!=...` is used) the specified labels.
      

  """
  @spec container_prune(keyword) :: {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def container_prune(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters])

    client.request(%{
      args: [],
      call: {Engine.Container, :container_prune},
      url: "/containers/prune",
      method: :post,
      query: query,
      response: [
        {200, {Engine.Container, :container_prune_200_json_resp}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Rename a container

  ## Options

    * `name`: New name for the container

  """
  @spec container_rename(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def container_rename(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:name])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_rename},
      url: "/containers/#{id}/rename",
      method: :post,
      query: query,
      response: [
        {204, :null},
        {404, {Engine.ErrorResponse, :t}},
        {409, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Resize a container TTY

  Resize the TTY for a container.

  ## Options

    * `h`: Height of the TTY session in characters
    * `w`: Width of the TTY session in characters

  """
  @spec container_resize(String.t(), keyword) :: :ok | {:error, any | Engine.ErrorResponse.t()}
  def container_resize(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:h, :w])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_resize},
      url: "/containers/#{id}/resize",
      method: :post,
      query: query,
      response: [
        {200, :null},
        {404, {:union, [:unknown, {Engine.ErrorResponse, :t}]}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Restart a container

  ## Options

    * `signal`: Signal to send to the container as an integer or string (e.g. `SIGINT`).
      
    * `t`: Number of seconds to wait before killing the container

  """
  @spec container_restart(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def container_restart(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:signal, :t])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_restart},
      url: "/containers/#{id}/restart",
      method: :post,
      query: query,
      response: [
        {204, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Start a container

  ## Options

    * `detachKeys`: Override the key sequence for detaching a container. Format is a
      single character `[a-Z]` or `ctrl-<value>` where `<value>` is one
      of: `a-z`, `@`, `^`, `[`, `,` or `_`.
      

  """
  @spec container_start(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def container_start(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:detachKeys])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_start},
      url: "/containers/#{id}/start",
      method: :post,
      query: query,
      response: [
        {204, :null},
        {304, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get container stats based on resource usage

  This endpoint returns a live stream of a container’s resource usage
  statistics.

  The `precpu_stats` is the CPU statistic of the *previous* read, and is
  used to calculate the CPU usage percentage. It is not an exact copy
  of the `cpu_stats` field.

  If either `precpu_stats.online_cpus` or `cpu_stats.online_cpus` is
  nil then for compatibility with older daemons the length of the
  corresponding `cpu_usage.percpu_usage` array should be used.

  On a cgroup v2 host, the following fields are not set
  * `blkio_stats`: all fields other than `io_service_bytes_recursive`
  * `cpu_stats`: `cpu_usage.percpu_usage`
  * `memory_stats`: `max_usage` and `failcnt`
  Also, `memory_stats.stats` fields are incompatible with cgroup v1.

  To calculate the values shown by the `stats` command of the docker cli tool
  the following formulas can be used:
  * used_memory = `memory_stats.usage - memory_stats.stats.cache`
  * available_memory = `memory_stats.limit`
  * Memory usage % = `(used_memory / available_memory) * 100.0`
  * cpu_delta = `cpu_stats.cpu_usage.total_usage - precpu_stats.cpu_usage.total_usage`
  * system_cpu_delta = `cpu_stats.system_cpu_usage - precpu_stats.system_cpu_usage`
  * number_cpus = `lenght(cpu_stats.cpu_usage.percpu_usage)` or `cpu_stats.online_cpus`
  * CPU usage % = `(cpu_delta / system_cpu_delta) * number_cpus * 100.0`


  ## Options

    * `stream`: Stream the output. If false, the stats will be output once and then
      it will disconnect.
      
    * `one-shot`: Only get a single stat instead of waiting for 2 cycles. Must be used
      with `stream=false`.
      

  """
  @spec container_stats(String.t(), keyword) :: {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def container_stats(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"one-shot", :stream])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_stats},
      url: "/containers/#{id}/stats",
      method: :get,
      query: query,
      response: [
        {200, :map},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Stop a container

  ## Options

    * `signal`: Signal to send to the container as an integer or string (e.g. `SIGINT`).
      
    * `t`: Number of seconds to wait before killing the container

  """
  @spec container_stop(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def container_stop(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:signal, :t])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_stop},
      url: "/containers/#{id}/stop",
      method: :post,
      query: query,
      response: [
        {204, :null},
        {304, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type container_top_200__resp :: %{Processes: [[String.t()]] | nil, Titles: [String.t()] | nil}

  @type container_top_200_json_resp :: %{
          Processes: [[String.t()]] | nil,
          Titles: [String.t()] | nil
        }

  @doc """
  List processes running inside a container

  On Unix systems, this is done by running the `ps` command. This endpoint
  is not supported on Windows.


  ## Options

    * `ps_args`: The arguments to pass to `ps`. For example, `aux`

  """
  @spec container_top(String.t(), keyword) :: {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def container_top(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ps_args])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_top},
      url: "/containers/#{id}/top",
      method: :get,
      query: query,
      response: [
        {200,
         {:union,
          [
            {Engine.Container, :container_top_200__resp},
            {Engine.Container, :container_top_200_json_resp}
          ]}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Unpause a container

  Resume a container which has been paused.
  """
  @spec container_unpause(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def container_unpause(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_unpause},
      url: "/containers/#{id}/unpause",
      method: :post,
      response: [
        {204, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type container_update_200_json_resp :: %{Warnings: [String.t()] | nil}

  @doc """
  Update a container

  Change various configuration options of a container without having to
  recreate it.

  """
  @spec container_update(String.t(), map, keyword) ::
          {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def container_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Engine.Container, :container_update},
      url: "/containers/#{id}/update",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {Engine.Container, :container_update_200_json_resp}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Wait for a container

  Block until a container stops, then returns the exit code.

  ## Options

    * `condition`: Wait until a container state reaches the given condition.
      
      Defaults to `not-running` if omitted or empty.
      

  """
  @spec container_wait(String.t(), keyword) ::
          {:ok, Engine.ContainerWaitResponse.t()} | {:error, Engine.ErrorResponse.t()}
  def container_wait(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:condition])

    client.request(%{
      args: [id: id],
      call: {Engine.Container, :container_wait},
      url: "/containers/#{id}/wait",
      method: :post,
      query: query,
      response: [
        {200, {Engine.ContainerWaitResponse, :t}},
        {400, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Extract an archive of files or folders to a directory in a container

  Upload a tar archive to be extracted to a path in the filesystem of container id.
  `path` parameter is asserted to be a directory. If it exists as a file, 400 error
  will be returned with message "not a directory".


  ## Options

    * `path`: Path to a directory in the container to extract the archive’s contents into. 
    * `noOverwriteDirNonDir`: If `1`, `true`, or `True` then it will be an error if unpacking the
      given content would cause an existing directory to be replaced with
      a non-directory and vice versa.
      
    * `copyUIDGID`: If `1`, `true`, then it will copy UID/GID maps to the dest file or
      dir
      

  """
  @spec put_container_archive(String.t(), String.t(), keyword) ::
          :ok | {:error, Engine.ErrorResponse.t()}
  def put_container_archive(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:copyUIDGID, :noOverwriteDirNonDir, :path])

    client.request(%{
      args: [id: id, body: body],
      call: {Engine.Container, :put_container_archive},
      url: "/containers/#{id}/archive",
      body: body,
      method: :put,
      query: query,
      request: [
        {"application/octet-stream", {:string, :generic}},
        {"application/x-tar", {:string, :generic}}
      ],
      response: [
        {200, :null},
        {400, {Engine.ErrorResponse, :t}},
        {403, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:container_inspect_200_json_resp) do
    [
      AppArmorProfile: {:string, :generic},
      Args: [string: :generic],
      Config: {Engine.ContainerConfig, :t},
      Created: {:string, :generic},
      Driver: {:string, :generic},
      ExecIDs: [string: :generic],
      GraphDriver: {Engine.DriverData, :t},
      HostConfig: {Engine.HostConfig, :t},
      HostnamePath: {:string, :generic},
      HostsPath: {:string, :generic},
      Id: {:string, :generic},
      Image: {:string, :generic},
      LogPath: {:string, :generic},
      MountLabel: {:string, :generic},
      Mounts: [{Engine.MountPoint, :t}],
      Name: {:string, :generic},
      NetworkSettings: {Engine.NetworkSettings, :t},
      Path: {:string, :generic},
      Platform: {:string, :generic},
      ProcessLabel: {:string, :generic},
      ResolvConfPath: {:string, :generic},
      RestartCount: :integer,
      SizeRootFs: :integer,
      SizeRw: :integer,
      State: {Engine.ContainerState, :t}
    ]
  end

  def __fields__(:container_prune_200_json_resp) do
    [ContainersDeleted: [string: :generic], SpaceReclaimed: :integer]
  end

  def __fields__(:container_top_200__resp) do
    [Processes: [[string: :generic]], Titles: [string: :generic]]
  end

  def __fields__(:container_top_200_json_resp) do
    [Processes: [[string: :generic]], Titles: [string: :generic]]
  end

  def __fields__(:container_update_200_json_resp) do
    [Warnings: [string: :generic]]
  end
end
