defmodule Engine.SwarmSpecEncryptionConfig do
  @moduledoc """
  Provides struct and type for a SwarmSpecEncryptionConfig
  """

  @type t :: %__MODULE__{AutoLockManagers: boolean | nil}

  defstruct [:AutoLockManagers]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [AutoLockManagers: :boolean]
  end
end
