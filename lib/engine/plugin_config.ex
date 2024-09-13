defmodule Engine.PluginConfig do
  @moduledoc """
  Provides struct and type for a PluginConfig
  """

  @type t :: %__MODULE__{
          Args: Engine.PluginConfigArgs.t(),
          Description: String.t(),
          DockerVersion: String.t() | nil,
          Documentation: String.t(),
          Entrypoint: [String.t()],
          Env: [Engine.PluginEnv.t()],
          Interface: Engine.PluginConfigInterface.t(),
          IpcHost: boolean,
          Linux: Engine.PluginConfigLinux.t(),
          Mounts: [Engine.PluginMount.t()],
          Network: Engine.PluginConfigNetwork.t(),
          PidHost: boolean,
          PropagatedMount: String.t(),
          User: Engine.PluginConfigUser.t() | nil,
          WorkDir: String.t(),
          rootfs: Engine.PluginConfigRootfs.t() | nil
        }

  defstruct [
    :Args,
    :Description,
    :DockerVersion,
    :Documentation,
    :Entrypoint,
    :Env,
    :Interface,
    :IpcHost,
    :Linux,
    :Mounts,
    :Network,
    :PidHost,
    :PropagatedMount,
    :User,
    :WorkDir,
    :rootfs
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Args: {Engine.PluginConfigArgs, :t},
      Description: {:string, :generic},
      DockerVersion: {:string, :generic},
      Documentation: {:string, :generic},
      Entrypoint: [string: :generic],
      Env: [{Engine.PluginEnv, :t}],
      Interface: {Engine.PluginConfigInterface, :t},
      IpcHost: :boolean,
      Linux: {Engine.PluginConfigLinux, :t},
      Mounts: [{Engine.PluginMount, :t}],
      Network: {Engine.PluginConfigNetwork, :t},
      PidHost: :boolean,
      PropagatedMount: {:string, :generic},
      User: {Engine.PluginConfigUser, :t},
      WorkDir: {:string, :generic},
      rootfs: {Engine.PluginConfigRootfs, :t}
    ]
  end
end
