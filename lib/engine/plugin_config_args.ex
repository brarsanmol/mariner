defmodule Engine.PluginConfigArgs do
  @moduledoc """
  Provides struct and type for a PluginConfigArgs
  """

  @type t :: %__MODULE__{
          Description: String.t(),
          Name: String.t(),
          Settable: [String.t()],
          Value: [String.t()]
        }

  defstruct [:Description, :Name, :Settable, :Value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Description: {:string, :generic},
      Name: {:string, :generic},
      Settable: [string: :generic],
      Value: [string: :generic]
    ]
  end
end
