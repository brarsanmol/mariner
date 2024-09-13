defmodule Engine.Mount do
  @moduledoc """
  Provides struct and type for a Mount
  """

  @type t :: %__MODULE__{
          BindOptions: Engine.MountBindOptions.t() | nil,
          Consistency: String.t() | nil,
          ReadOnly: boolean | nil,
          Source: String.t() | nil,
          Target: String.t() | nil,
          TmpfsOptions: Engine.MountTmpfsOptions.t() | nil,
          Type: String.t() | nil,
          VolumeOptions: Engine.MountVolumeOptions.t() | nil
        }

  defstruct [
    :BindOptions,
    :Consistency,
    :ReadOnly,
    :Source,
    :Target,
    :TmpfsOptions,
    :Type,
    :VolumeOptions
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      BindOptions: {Engine.MountBindOptions, :t},
      Consistency: {:string, :generic},
      ReadOnly: :boolean,
      Source: {:string, :generic},
      Target: {:string, :generic},
      TmpfsOptions: {Engine.MountTmpfsOptions, :t},
      Type: {:enum, ["bind", "volume", "tmpfs", "npipe", "cluster"]},
      VolumeOptions: {Engine.MountVolumeOptions, :t}
    ]
  end
end
