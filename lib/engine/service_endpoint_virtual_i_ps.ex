defmodule Engine.ServiceEndpointVirtualIPs do
  @moduledoc """
  Provides struct and type for a ServiceEndpointVirtualIPs
  """

  @type t :: %__MODULE__{Addr: String.t() | nil, NetworkID: String.t() | nil}

  defstruct [:Addr, :NetworkID]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Addr: {:string, :generic}, NetworkID: {:string, :generic}]
  end
end
