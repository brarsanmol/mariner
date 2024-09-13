defmodule Engine.ContainerState do
  @moduledoc """
  Provides struct and type for a ContainerState
  """

  @type t :: %__MODULE__{
          Dead: boolean | nil,
          Error: String.t() | nil,
          ExitCode: integer | nil,
          FinishedAt: String.t() | nil,
          Health: Engine.Health.t() | nil,
          OOMKilled: boolean | nil,
          Paused: boolean | nil,
          Pid: integer | nil,
          Restarting: boolean | nil,
          Running: boolean | nil,
          StartedAt: String.t() | nil,
          Status: String.t() | nil
        }

  defstruct [
    :Dead,
    :Error,
    :ExitCode,
    :FinishedAt,
    :Health,
    :OOMKilled,
    :Paused,
    :Pid,
    :Restarting,
    :Running,
    :StartedAt,
    :Status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Dead: :boolean,
      Error: {:string, :generic},
      ExitCode: :integer,
      FinishedAt: {:string, :generic},
      Health: {Engine.Health, :t},
      OOMKilled: :boolean,
      Paused: :boolean,
      Pid: :integer,
      Restarting: :boolean,
      Running: :boolean,
      StartedAt: {:string, :generic},
      Status:
        {:enum, ["created", "running", "paused", "restarting", "removing", "exited", "dead"]}
    ]
  end
end
