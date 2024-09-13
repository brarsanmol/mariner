defmodule Engine.MountVolumeOptionsDriverConfig do
  @moduledoc """
  Provides struct and type for a MountVolumeOptionsDriverConfig
  """

  @type t :: %__MODULE__{
          Name: String.t() | nil,
          Options: Engine.MountVolumeOptionsDriverConfigOptions.t() | nil
        }

  defstruct [:Name, :Options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Name: {:string, :generic}, Options: {Engine.MountVolumeOptionsDriverConfigOptions, :t}]
  end
end
