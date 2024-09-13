defmodule Engine.BuildCache do
  @moduledoc """
  Provides struct and type for a BuildCache
  """

  @type t :: %__MODULE__{
          CreatedAt: String.t() | nil,
          Description: String.t() | nil,
          ID: String.t() | nil,
          InUse: boolean | nil,
          LastUsedAt: String.t() | nil,
          Parent: String.t() | nil,
          Parents: [String.t()] | nil,
          Shared: boolean | nil,
          Size: integer | nil,
          Type: String.t() | nil,
          UsageCount: integer | nil
        }

  defstruct [
    :CreatedAt,
    :Description,
    :ID,
    :InUse,
    :LastUsedAt,
    :Parent,
    :Parents,
    :Shared,
    :Size,
    :Type,
    :UsageCount
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CreatedAt: {:string, :generic},
      Description: {:string, :generic},
      ID: {:string, :generic},
      InUse: :boolean,
      LastUsedAt: {:string, :generic},
      Parent: {:string, :generic},
      Parents: [string: :generic],
      Shared: :boolean,
      Size: :integer,
      Type:
        {:enum,
         [
           "internal",
           "frontend",
           "source.local",
           "source.git.checkout",
           "exec.cachemount",
           "regular"
         ]},
      UsageCount: :integer
    ]
  end
end
