defmodule Engine.HostConfig do
  @moduledoc """
  Provides struct and type for a HostConfig
  """

  @type t :: %__MODULE__{
          Annotations: Engine.HostConfigAnnotations.t() | nil,
          AutoRemove: boolean | nil,
          Binds: [String.t()] | nil,
          BlkioDeviceReadBps: [Engine.ThrottleDevice.t()] | nil,
          BlkioDeviceReadIOps: [Engine.ThrottleDevice.t()] | nil,
          BlkioDeviceWriteBps: [Engine.ThrottleDevice.t()] | nil,
          BlkioDeviceWriteIOps: [Engine.ThrottleDevice.t()] | nil,
          BlkioWeight: integer | nil,
          BlkioWeightDevice: [map] | nil,
          CapAdd: [String.t()] | nil,
          CapDrop: [String.t()] | nil,
          Cgroup: String.t() | nil,
          CgroupParent: String.t() | nil,
          CgroupnsMode: String.t() | nil,
          ConsoleSize: [integer] | nil,
          ContainerIDFile: String.t() | nil,
          CpuCount: integer | nil,
          CpuPercent: integer | nil,
          CpuPeriod: integer | nil,
          CpuQuota: integer | nil,
          CpuRealtimePeriod: integer | nil,
          CpuRealtimeRuntime: integer | nil,
          CpuShares: integer | nil,
          CpusetCpus: String.t() | nil,
          CpusetMems: String.t() | nil,
          DeviceCgroupRules: [String.t()] | nil,
          DeviceRequests: [Engine.DeviceRequest.t()] | nil,
          Devices: [Engine.DeviceMapping.t()] | nil,
          Dns: [String.t()] | nil,
          DnsOptions: [String.t()] | nil,
          DnsSearch: [String.t()] | nil,
          ExtraHosts: [String.t()] | nil,
          GroupAdd: [String.t()] | nil,
          IOMaximumBandwidth: integer | nil,
          IOMaximumIOps: integer | nil,
          Init: boolean | nil,
          IpcMode: String.t() | nil,
          Isolation: String.t() | nil,
          KernelMemoryTCP: integer | nil,
          Links: [String.t()] | nil,
          LogConfig: Engine.HostConfigLogConfig.t() | nil,
          MaskedPaths: [String.t()] | nil,
          Memory: integer | nil,
          MemoryReservation: integer | nil,
          MemorySwap: integer | nil,
          MemorySwappiness: integer | nil,
          Mounts: [Engine.Mount.t()] | nil,
          NanoCpus: integer | nil,
          NetworkMode: String.t() | nil,
          OomKillDisable: boolean | nil,
          OomScoreAdj: integer | nil,
          PidMode: String.t() | nil,
          PidsLimit: integer | nil,
          PortBindings: Engine.PortMap.t() | nil,
          Privileged: boolean | nil,
          PublishAllPorts: boolean | nil,
          ReadonlyPaths: [String.t()] | nil,
          ReadonlyRootfs: boolean | nil,
          RestartPolicy: Engine.RestartPolicy.t() | nil,
          Runtime: String.t() | nil,
          SecurityOpt: [String.t()] | nil,
          ShmSize: integer | nil,
          StorageOpt: Engine.HostConfigStorageOpt.t() | nil,
          Sysctls: Engine.HostConfigSysctls.t() | nil,
          Tmpfs: Engine.HostConfigTmpfs.t() | nil,
          UTSMode: String.t() | nil,
          Ulimits: [map] | nil,
          UsernsMode: String.t() | nil,
          VolumeDriver: String.t() | nil,
          VolumesFrom: [String.t()] | nil
        }

  defstruct [
    :Annotations,
    :AutoRemove,
    :Binds,
    :BlkioDeviceReadBps,
    :BlkioDeviceReadIOps,
    :BlkioDeviceWriteBps,
    :BlkioDeviceWriteIOps,
    :BlkioWeight,
    :BlkioWeightDevice,
    :CapAdd,
    :CapDrop,
    :Cgroup,
    :CgroupParent,
    :CgroupnsMode,
    :ConsoleSize,
    :ContainerIDFile,
    :CpuCount,
    :CpuPercent,
    :CpuPeriod,
    :CpuQuota,
    :CpuRealtimePeriod,
    :CpuRealtimeRuntime,
    :CpuShares,
    :CpusetCpus,
    :CpusetMems,
    :DeviceCgroupRules,
    :DeviceRequests,
    :Devices,
    :Dns,
    :DnsOptions,
    :DnsSearch,
    :ExtraHosts,
    :GroupAdd,
    :IOMaximumBandwidth,
    :IOMaximumIOps,
    :Init,
    :IpcMode,
    :Isolation,
    :KernelMemoryTCP,
    :Links,
    :LogConfig,
    :MaskedPaths,
    :Memory,
    :MemoryReservation,
    :MemorySwap,
    :MemorySwappiness,
    :Mounts,
    :NanoCpus,
    :NetworkMode,
    :OomKillDisable,
    :OomScoreAdj,
    :PidMode,
    :PidsLimit,
    :PortBindings,
    :Privileged,
    :PublishAllPorts,
    :ReadonlyPaths,
    :ReadonlyRootfs,
    :RestartPolicy,
    :Runtime,
    :SecurityOpt,
    :ShmSize,
    :StorageOpt,
    :Sysctls,
    :Tmpfs,
    :UTSMode,
    :Ulimits,
    :UsernsMode,
    :VolumeDriver,
    :VolumesFrom
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Annotations: {Engine.HostConfigAnnotations, :t},
      AutoRemove: :boolean,
      Binds: [string: :generic],
      BlkioDeviceReadBps: [{Engine.ThrottleDevice, :t}],
      BlkioDeviceReadIOps: [{Engine.ThrottleDevice, :t}],
      BlkioDeviceWriteBps: [{Engine.ThrottleDevice, :t}],
      BlkioDeviceWriteIOps: [{Engine.ThrottleDevice, :t}],
      BlkioWeight: :integer,
      BlkioWeightDevice: [:map],
      CapAdd: [string: :generic],
      CapDrop: [string: :generic],
      Cgroup: {:string, :generic},
      CgroupParent: {:string, :generic},
      CgroupnsMode: {:enum, ["private", "host"]},
      ConsoleSize: [:integer],
      ContainerIDFile: {:string, :generic},
      CpuCount: :integer,
      CpuPercent: :integer,
      CpuPeriod: :integer,
      CpuQuota: :integer,
      CpuRealtimePeriod: :integer,
      CpuRealtimeRuntime: :integer,
      CpuShares: :integer,
      CpusetCpus: {:string, :generic},
      CpusetMems: {:string, :generic},
      DeviceCgroupRules: [string: :generic],
      DeviceRequests: [{Engine.DeviceRequest, :t}],
      Devices: [{Engine.DeviceMapping, :t}],
      Dns: [string: :generic],
      DnsOptions: [string: :generic],
      DnsSearch: [string: :generic],
      ExtraHosts: [string: :generic],
      GroupAdd: [string: :generic],
      IOMaximumBandwidth: :integer,
      IOMaximumIOps: :integer,
      Init: :boolean,
      IpcMode: {:string, :generic},
      Isolation: {:enum, ["default", "process", "hyperv"]},
      KernelMemoryTCP: :integer,
      Links: [string: :generic],
      LogConfig: {Engine.HostConfigLogConfig, :t},
      MaskedPaths: [string: :generic],
      Memory: :integer,
      MemoryReservation: :integer,
      MemorySwap: :integer,
      MemorySwappiness: :integer,
      Mounts: [{Engine.Mount, :t}],
      NanoCpus: :integer,
      NetworkMode: {:string, :generic},
      OomKillDisable: :boolean,
      OomScoreAdj: :integer,
      PidMode: {:string, :generic},
      PidsLimit: :integer,
      PortBindings: {Engine.PortMap, :t},
      Privileged: :boolean,
      PublishAllPorts: :boolean,
      ReadonlyPaths: [string: :generic],
      ReadonlyRootfs: :boolean,
      RestartPolicy: {Engine.RestartPolicy, :t},
      Runtime: {:string, :generic},
      SecurityOpt: [string: :generic],
      ShmSize: :integer,
      StorageOpt: {Engine.HostConfigStorageOpt, :t},
      Sysctls: {Engine.HostConfigSysctls, :t},
      Tmpfs: {Engine.HostConfigTmpfs, :t},
      UTSMode: {:string, :generic},
      Ulimits: [:map],
      UsernsMode: {:string, :generic},
      VolumeDriver: {:string, :generic},
      VolumesFrom: [string: :generic]
    ]
  end
end
