defmodule Engine.TaskSpecContainerSpec do
  @moduledoc """
  Provides struct and type for a TaskSpecContainerSpec
  """

  @type t :: %__MODULE__{
          Args: [String.t()] | nil,
          CapabilityAdd: [String.t()] | nil,
          CapabilityDrop: [String.t()] | nil,
          Command: [String.t()] | nil,
          Configs: [Engine.TaskSpecContainerSpecConfigs.t()] | nil,
          DNSConfig: Engine.TaskSpecContainerSpecDNSConfig.t() | nil,
          Dir: String.t() | nil,
          Env: [String.t()] | nil,
          Groups: [String.t()] | nil,
          HealthCheck: Engine.HealthConfig.t() | nil,
          Hostname: String.t() | nil,
          Hosts: [String.t()] | nil,
          Image: String.t() | nil,
          Init: boolean | nil,
          Isolation: String.t() | nil,
          Labels: Engine.TaskSpecContainerSpecLabels.t() | nil,
          Mounts: [Engine.Mount.t()] | nil,
          OomScoreAdj: integer | nil,
          OpenStdin: boolean | nil,
          Privileges: Engine.TaskSpecContainerSpecPrivileges.t() | nil,
          ReadOnly: boolean | nil,
          Secrets: [Engine.TaskSpecContainerSpecSecrets.t()] | nil,
          StopGracePeriod: integer | nil,
          StopSignal: String.t() | nil,
          Sysctls: Engine.TaskSpecContainerSpecSysctls.t() | nil,
          TTY: boolean | nil,
          Ulimits: [Engine.TaskSpecContainerSpecUlimits.t()] | nil,
          User: String.t() | nil
        }

  defstruct [
    :Args,
    :CapabilityAdd,
    :CapabilityDrop,
    :Command,
    :Configs,
    :DNSConfig,
    :Dir,
    :Env,
    :Groups,
    :HealthCheck,
    :Hostname,
    :Hosts,
    :Image,
    :Init,
    :Isolation,
    :Labels,
    :Mounts,
    :OomScoreAdj,
    :OpenStdin,
    :Privileges,
    :ReadOnly,
    :Secrets,
    :StopGracePeriod,
    :StopSignal,
    :Sysctls,
    :TTY,
    :Ulimits,
    :User
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Args: [string: :generic],
      CapabilityAdd: [string: :generic],
      CapabilityDrop: [string: :generic],
      Command: [string: :generic],
      Configs: [{Engine.TaskSpecContainerSpecConfigs, :t}],
      DNSConfig: {Engine.TaskSpecContainerSpecDNSConfig, :t},
      Dir: {:string, :generic},
      Env: [string: :generic],
      Groups: [string: :generic],
      HealthCheck: {Engine.HealthConfig, :t},
      Hostname: {:string, :generic},
      Hosts: [string: :generic],
      Image: {:string, :generic},
      Init: :boolean,
      Isolation: {:enum, ["default", "process", "hyperv"]},
      Labels: {Engine.TaskSpecContainerSpecLabels, :t},
      Mounts: [{Engine.Mount, :t}],
      OomScoreAdj: :integer,
      OpenStdin: :boolean,
      Privileges: {Engine.TaskSpecContainerSpecPrivileges, :t},
      ReadOnly: :boolean,
      Secrets: [{Engine.TaskSpecContainerSpecSecrets, :t}],
      StopGracePeriod: :integer,
      StopSignal: {:string, :generic},
      Sysctls: {Engine.TaskSpecContainerSpecSysctls, :t},
      TTY: :boolean,
      Ulimits: [{Engine.TaskSpecContainerSpecUlimits, :t}],
      User: {:string, :generic}
    ]
  end
end
