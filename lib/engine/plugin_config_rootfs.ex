defmodule Engine.PluginConfigRootfs do
  @moduledoc """
  Provides struct and type for a PluginConfigRootfs
  """

  @type t :: %__MODULE__{diff_ids: [String.t()] | nil, type: String.t() | nil}

  defstruct [:diff_ids, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [diff_ids: [string: :generic], type: {:string, :generic}]
  end
end
