defmodule Engine.PeerInfo do
  @moduledoc """
  Provides struct and type for a PeerInfo
  """

  @type t :: %__MODULE__{IP: String.t() | nil, Name: String.t() | nil}

  defstruct [:IP, :Name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [IP: {:string, :generic}, Name: {:string, :generic}]
  end
end
