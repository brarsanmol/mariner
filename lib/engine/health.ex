defmodule Engine.Health do
  @moduledoc """
  Provides struct and type for a Health
  """

  @type t :: %__MODULE__{
          FailingStreak: integer | nil,
          Log: [Engine.HealthcheckResult.t()] | nil,
          Status: String.t() | nil
        }

  defstruct [:FailingStreak, :Log, :Status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      FailingStreak: :integer,
      Log: [{Engine.HealthcheckResult, :t}],
      Status: {:enum, ["none", "starting", "healthy", "unhealthy"]}
    ]
  end
end
