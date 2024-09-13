defmodule Engine.IPAM do
  @moduledoc """
  Provides struct and type for a IPAM
  """

  @type t :: %__MODULE__{
          Config: [Engine.IPAMConfig.t()] | nil,
          Driver: String.t() | nil,
          Options: Engine.IPAMOptions.t() | nil
        }

  defstruct [:Config, :Driver, :Options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Config: [{Engine.IPAMConfig, :t}],
      Driver: {:string, :generic},
      Options: {Engine.IPAMOptions, :t}
    ]
  end
end
