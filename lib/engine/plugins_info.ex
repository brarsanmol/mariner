defmodule Engine.PluginsInfo do
  @moduledoc """
  Provides struct and type for a PluginsInfo
  """

  @type t :: %__MODULE__{
          Authorization: [String.t()] | nil,
          Log: [String.t()] | nil,
          Network: [String.t()] | nil,
          Volume: [String.t()] | nil
        }

  defstruct [:Authorization, :Log, :Network, :Volume]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Authorization: [string: :generic],
      Log: [string: :generic],
      Network: [string: :generic],
      Volume: [string: :generic]
    ]
  end
end
