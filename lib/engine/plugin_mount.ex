defmodule Engine.PluginMount do
  @moduledoc """
  Provides struct and type for a PluginMount
  """

  @type t :: %__MODULE__{
          Description: String.t(),
          Destination: String.t(),
          Name: String.t(),
          Options: [String.t()],
          Settable: [String.t()],
          Source: String.t(),
          Type: String.t()
        }

  defstruct [:Description, :Destination, :Name, :Options, :Settable, :Source, :Type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Description: {:string, :generic},
      Destination: {:string, :generic},
      Name: {:string, :generic},
      Options: [string: :generic],
      Settable: [string: :generic],
      Source: {:string, :generic},
      Type: {:string, :generic}
    ]
  end
end
