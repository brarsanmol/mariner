defmodule Engine.ContainerdInfo do
  @moduledoc """
  Provides struct and type for a ContainerdInfo
  """

  @type t :: %__MODULE__{
          Address: String.t() | nil,
          Namespaces: Engine.ContainerdInfoNamespaces.t() | nil
        }

  defstruct [:Address, :Namespaces]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Address: {:string, :generic}, Namespaces: {Engine.ContainerdInfoNamespaces, :t}]
  end
end
