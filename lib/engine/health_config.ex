defmodule Engine.HealthConfig do
  @moduledoc """
  Provides struct and type for a HealthConfig
  """

  @type t :: %__MODULE__{
          Interval: integer | nil,
          Retries: integer | nil,
          StartInterval: integer | nil,
          StartPeriod: integer | nil,
          Test: [String.t()] | nil,
          Timeout: integer | nil
        }

  defstruct [:Interval, :Retries, :StartInterval, :StartPeriod, :Test, :Timeout]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Interval: :integer,
      Retries: :integer,
      StartInterval: :integer,
      StartPeriod: :integer,
      Test: [string: :generic],
      Timeout: :integer
    ]
  end
end
