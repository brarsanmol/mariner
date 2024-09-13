defmodule Engine.TaskSpecPluginSpec do
  @moduledoc """
  Provides struct and type for a TaskSpecPluginSpec
  """

  @type t :: %__MODULE__{
          Disabled: boolean | nil,
          Name: String.t() | nil,
          PluginPrivilege: [Engine.PluginPrivilege.t()] | nil,
          Remote: String.t() | nil
        }

  defstruct [:Disabled, :Name, :PluginPrivilege, :Remote]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Disabled: :boolean,
      Name: {:string, :generic},
      PluginPrivilege: [{Engine.PluginPrivilege, :t}],
      Remote: {:string, :generic}
    ]
  end
end
