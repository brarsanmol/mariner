defmodule Engine.RestartPolicy do
  @moduledoc """
  Provides struct and type for a RestartPolicy
  """

  @type t :: %__MODULE__{MaximumRetryCount: integer | nil, Name: String.t() | nil}

  defstruct [:MaximumRetryCount, :Name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      MaximumRetryCount: :integer,
      Name: {:enum, ["", "no", "always", "unless-stopped", "on-failure"]}
    ]
  end
end
