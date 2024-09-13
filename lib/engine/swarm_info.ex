defmodule Engine.SwarmInfo do
  @moduledoc """
  Provides struct and type for a SwarmInfo
  """

  @type t :: %__MODULE__{
          Cluster: Engine.ClusterInfo.t() | nil,
          ControlAvailable: boolean | nil,
          Error: String.t() | nil,
          LocalNodeState: String.t() | nil,
          Managers: integer | nil,
          NodeAddr: String.t() | nil,
          NodeID: String.t() | nil,
          Nodes: integer | nil,
          RemoteManagers: [Engine.PeerNode.t()] | nil
        }

  defstruct [
    :Cluster,
    :ControlAvailable,
    :Error,
    :LocalNodeState,
    :Managers,
    :NodeAddr,
    :NodeID,
    :Nodes,
    :RemoteManagers
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Cluster: {Engine.ClusterInfo, :t},
      ControlAvailable: :boolean,
      Error: {:string, :generic},
      LocalNodeState: {:enum, ["", "inactive", "pending", "active", "error", "locked"]},
      Managers: :integer,
      NodeAddr: {:string, :generic},
      NodeID: {:string, :generic},
      Nodes: :integer,
      RemoteManagers: [{Engine.PeerNode, :t}]
    ]
  end
end
