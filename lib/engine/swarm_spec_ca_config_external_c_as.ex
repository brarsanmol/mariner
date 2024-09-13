defmodule Engine.SwarmSpecCAConfigExternalCAs do
  @moduledoc """
  Provides struct and type for a SwarmSpecCAConfigExternalCAs
  """

  @type t :: %__MODULE__{
          CACert: String.t() | nil,
          Options: Engine.SwarmSpecCAConfigExternalCAsOptions.t() | nil,
          Protocol: String.t() | nil,
          URL: String.t() | nil
        }

  defstruct [:CACert, :Options, :Protocol, :URL]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CACert: {:string, :generic},
      Options: {Engine.SwarmSpecCAConfigExternalCAsOptions, :t},
      Protocol: {:const, "cfssl"},
      URL: {:string, :generic}
    ]
  end
end
