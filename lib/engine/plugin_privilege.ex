defmodule Engine.PluginPrivilege do
  @moduledoc """
  Provides struct and type for a PluginPrivilege
  """

  @type t :: %__MODULE__{
          Description: String.t() | nil,
          Name: String.t() | nil,
          Value: [String.t()] | nil
        }

  defstruct [:Description, :Name, :Value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Description: {:string, :generic}, Name: {:string, :generic}, Value: [string: :generic]]
  end
end
