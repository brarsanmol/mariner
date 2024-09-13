defmodule Engine.EngineDescription do
  @moduledoc """
  Provides struct and type for a EngineDescription
  """

  @type t :: %__MODULE__{
          EngineVersion: String.t() | nil,
          Labels: Engine.EngineDescriptionLabels.t() | nil,
          Plugins: [Engine.EngineDescriptionPlugins.t()] | nil
        }

  defstruct [:EngineVersion, :Labels, :Plugins]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      EngineVersion: {:string, :generic},
      Labels: {Engine.EngineDescriptionLabels, :t},
      Plugins: [{Engine.EngineDescriptionPlugins, :t}]
    ]
  end
end
