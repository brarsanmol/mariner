defmodule Engine.ClusterInfo do
  @moduledoc """
  Provides struct and type for a ClusterInfo
  """

  @type t :: %__MODULE__{
          CreatedAt: String.t() | nil,
          DataPathPort: integer | nil,
          DefaultAddrPool: [String.t()] | nil,
          ID: String.t() | nil,
          RootRotationInProgress: boolean | nil,
          Spec: Engine.SwarmSpec.t() | nil,
          SubnetSize: integer | nil,
          TLSInfo: Engine.TLSInfo.t() | nil,
          UpdatedAt: String.t() | nil,
          Version: Engine.ObjectVersion.t() | nil
        }

  defstruct [
    :CreatedAt,
    :DataPathPort,
    :DefaultAddrPool,
    :ID,
    :RootRotationInProgress,
    :Spec,
    :SubnetSize,
    :TLSInfo,
    :UpdatedAt,
    :Version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CreatedAt: {:string, :generic},
      DataPathPort: :integer,
      DefaultAddrPool: [string: :generic],
      ID: {:string, :generic},
      RootRotationInProgress: :boolean,
      Spec: {Engine.SwarmSpec, :t},
      SubnetSize: :integer,
      TLSInfo: {Engine.TLSInfo, :t},
      UpdatedAt: {:string, :generic},
      Version: {Engine.ObjectVersion, :t}
    ]
  end
end
