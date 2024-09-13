defmodule Engine.Distribution do
  @moduledoc """
  Provides API endpoint related to distribution
  """

  @default_client Engine.Client

  @doc """
  Get image information from the registry

  Return image digest and platform information by contacting the registry.

  """
  @spec distribution_inspect(String.t(), keyword) ::
          {:ok, Engine.DistributionInspect.t()} | {:error, Engine.ErrorResponse.t()}
  def distribution_inspect(name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name],
      call: {Engine.Distribution, :distribution_inspect},
      url: "/distribution/#{name}/json",
      method: :get,
      response: [
        {200, {Engine.DistributionInspect, :t}},
        {401, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end
end
