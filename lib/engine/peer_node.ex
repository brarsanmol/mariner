defmodule Engine.PeerNode do
  @moduledoc """
  Provides struct and type for a PeerNode
  """

  @type t :: %__MODULE__{Addr: String.t() | nil, NodeID: String.t() | nil}

  defstruct [:Addr, :NodeID]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Addr: {:string, :generic}, NodeID: {:string, :generic}]
  end
end
