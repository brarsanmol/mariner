defmodule Engine.IPAMConfig do
  @moduledoc """
  Provides struct and type for a IPAMConfig
  """

  @type t :: %__MODULE__{
          AuxiliaryAddresses: Engine.IPAMConfigAuxiliaryAddresses.t() | nil,
          Gateway: String.t() | nil,
          IPRange: String.t() | nil,
          Subnet: String.t() | nil
        }

  defstruct [:AuxiliaryAddresses, :Gateway, :IPRange, :Subnet]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      AuxiliaryAddresses: {Engine.IPAMConfigAuxiliaryAddresses, :t},
      Gateway: {:string, :generic},
      IPRange: {:string, :generic},
      Subnet: {:string, :generic}
    ]
  end
end
