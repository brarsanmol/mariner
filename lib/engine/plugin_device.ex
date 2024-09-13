defmodule Engine.PluginDevice do
  @moduledoc """
  Provides struct and type for a PluginDevice
  """

  @type t :: %__MODULE__{
          Description: String.t(),
          Name: String.t(),
          Path: String.t(),
          Settable: [String.t()]
        }

  defstruct [:Description, :Name, :Path, :Settable]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Description: {:string, :generic},
      Name: {:string, :generic},
      Path: {:string, :generic},
      Settable: [string: :generic]
    ]
  end
end
