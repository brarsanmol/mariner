defmodule Mariner.DSL do
  @doc false
  defmacro __using__(_opts) do
    quote do
      import Mariner.DSL
    end
  end

  defmacro container(name, do: block) do
    quote do
      var!(config) = %{Name: unquote(name)}
      unquote(block)
      IO.inspect(var!(config), label: "DSL <> Container Configuration")
    end
  end

  defmacro host_name(value \\ "") do
    quote do
      var!(config) = Map.put(var!(config), :Hostname, unquote(value))
    end
  end

  defmacro domain_name(value \\ "") do
    quote do
      var!(config) = Map.put(var!(config), :Domainname, unquote(value))
    end
  end

  defmacro user(value \\ "") do
    quote do
      var!(config) = Map.put(var!(config), :User, unquote(value))
    end
  end

  defmacro exposed_ports(value \\ %{}) do
    quote do
      var!(config) = Map.put(var!(config), :ExposedPorts, unquote(value))
    end
  end

  defmacro env(value \\ []) do
    quote do
      var!(config) =
        Map.put(
          var!(config),
          :Env,
          Enum.map(unquote(value), fn var ->
            case String.split(var, "=", parts: 2) do
              [key, val] -> {key, val}
              [key] -> {key, nil}
            end
          end)
        )
    end
  end

  defmacro command(value \\ []) do
    quote do
      var!(config) = Map.put(var!(config), :Cmd, List.wrap(unquote(value)))
    end
  end

  defmacro health_check(
             test,
             interval \\ 0,
             timeout \\ 0,
             retries \\ 0,
             start_period \\ 0,
             start_interval \\ 0
           ) do
    quote do
      var!(config) =
        Map.put(var!(config), :Healthcheck, %{
          test: unquote(test),
          interval: unquote(interval),
          timeout: unquote(timeout),
          retries: unquote(retries),
          start_period: unquote(start_period),
          start_interval: unquote(start_interval)
        })
    end
  end

  defmacro image(value) do
    quote do
      var!(config) = Map.put(var!(config), :Image, unquote(value))
    end
  end

  defmacro volumes(value \\ %{}) do
    quote do
      var!(config) = Map.put(var!(config), :Volumes, unquote(value))
    end
  end

  defmacro working_directory(value \\ "") do
    quote do
      var!(config) = Map.put(var!(config), :WorkingDir, unquote(value))
    end
  end

  defmacro entrypoint(value \\ []) do
    quote do
      var!(config) = Map.put(var!(config), :Entrypoint, List.wrap(unquote(value)))
    end
  end

  defmacro network_disabled(value \\ false) do
    quote do
      var!(config) = Map.put(var!(config), :NetworkDisabled, unquote(value))
    end
  end

  defmacro mac_address(value \\ nil) do
    quote do
      var!(config) = Map.put(var!(config), :MacAddress, unquote(value))
    end
  end

  defmacro dns(value \\ "") do
    quote do
      var!(config) = Map.put(var!(config), :Dns, unquote(value))
    end
  end

  defmacro registry(value \\ "docker.io") do
    quote do
      var!(config) = Map.put(var!(config), :Registry, unquote(value))
    end
  end
end
