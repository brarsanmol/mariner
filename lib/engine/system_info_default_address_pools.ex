defmodule Engine.SystemInfoDefaultAddressPools do
  @moduledoc """
  Provides struct and type for a SystemInfoDefaultAddressPools
  """

  @type t :: %__MODULE__{Base: String.t() | nil, Size: integer | nil}

  defstruct [:Base, :Size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Base: {:string, :generic}, Size: :integer]
  end
end
