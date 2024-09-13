defmodule Engine.SecretSpec do
  @moduledoc """
  Provides struct and type for a SecretSpec
  """

  @type t :: %__MODULE__{
          Data: String.t() | nil,
          Driver: Engine.Driver.t() | nil,
          Labels: map | nil,
          Name: String.t() | nil,
          Templating: Engine.Driver.t() | nil
        }

  defstruct [:Data, :Driver, :Labels, :Name, :Templating]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Data: {:string, :generic},
      Driver: {Engine.Driver, :t},
      Labels: :map,
      Name: {:string, :generic},
      Templating: {Engine.Driver, :t}
    ]
  end
end
