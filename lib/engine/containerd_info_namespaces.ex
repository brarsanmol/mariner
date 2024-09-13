defmodule Engine.ContainerdInfoNamespaces do
  @moduledoc """
  Provides struct and type for a ContainerdInfoNamespaces
  """

  @type t :: %__MODULE__{Containers: String.t() | nil, Plugins: String.t() | nil}

  defstruct [:Containers, :Plugins]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Containers: {:string, :generic}, Plugins: {:string, :generic}]
  end
end
