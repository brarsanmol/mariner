defmodule Engine.ContainerConfig do
  @moduledoc """
  Provides struct and type for a ContainerConfig
  """

  @type t :: %__MODULE__{
          ArgsEscaped: boolean | nil,
          AttachStderr: boolean | nil,
          AttachStdin: boolean | nil,
          AttachStdout: boolean | nil,
          Cmd: [String.t()] | nil,
          Domainname: String.t() | nil,
          Entrypoint: [String.t()] | nil,
          Env: [String.t()] | nil,
          ExposedPorts: map | nil,
          Healthcheck: Engine.HealthConfig.t() | nil,
          Hostname: String.t() | nil,
          Image: String.t() | nil,
          Labels: map | nil,
          MacAddress: String.t() | nil,
          NetworkDisabled: boolean | nil,
          OnBuild: [String.t()] | nil,
          OpenStdin: boolean | nil,
          Shell: [String.t()] | nil,
          StdinOnce: boolean | nil,
          StopSignal: String.t() | nil,
          StopTimeout: integer | nil,
          Tty: boolean | nil,
          User: String.t() | nil,
          Volumes: map | nil,
          WorkingDir: String.t() | nil
        }

  defstruct [
    :ArgsEscaped,
    :AttachStderr,
    :AttachStdin,
    :AttachStdout,
    :Cmd,
    :Domainname,
    :Entrypoint,
    :Env,
    :ExposedPorts,
    :Healthcheck,
    :Hostname,
    :Image,
    :Labels,
    :MacAddress,
    :NetworkDisabled,
    :OnBuild,
    :OpenStdin,
    :Shell,
    :StdinOnce,
    :StopSignal,
    :StopTimeout,
    :Tty,
    :User,
    :Volumes,
    :WorkingDir
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ArgsEscaped: :boolean,
      AttachStderr: :boolean,
      AttachStdin: :boolean,
      AttachStdout: :boolean,
      Cmd: [string: :generic],
      Domainname: {:string, :generic},
      Entrypoint: [string: :generic],
      Env: [string: :generic],
      ExposedPorts: :map,
      Healthcheck: {Engine.HealthConfig, :t},
      Hostname: {:string, :generic},
      Image: {:string, :generic},
      Labels: :map,
      MacAddress: {:string, :generic},
      NetworkDisabled: :boolean,
      OnBuild: [string: :generic],
      OpenStdin: :boolean,
      Shell: [string: :generic],
      StdinOnce: :boolean,
      StopSignal: {:string, :generic},
      StopTimeout: :integer,
      Tty: :boolean,
      User: {:string, :generic},
      Volumes: :map,
      WorkingDir: {:string, :generic}
    ]
  end
end
