defmodule Engine.HostConfigLogConfig do
  @moduledoc """
  Provides struct and type for a HostConfigLogConfig
  """

  @type t :: %__MODULE__{
          Config: Engine.HostConfigLogConfigConfig.t() | nil,
          Type: String.t() | nil
        }

  defstruct [:Config, :Type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Config: {Engine.HostConfigLogConfigConfig, :t},
      Type:
        {:enum,
         [
           "json-file",
           "syslog",
           "journald",
           "gelf",
           "fluentd",
           "awslogs",
           "splunk",
           "etwlogs",
           "none"
         ]}
    ]
  end
end
