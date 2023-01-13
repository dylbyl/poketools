defmodule PokeToolsWeb.MakeUpAMonLive.Index do
  use Phoenix.LiveView, layout: {PokeToolsWeb.LayoutView, "live.html"}

  alias PokeToolsWeb.Router.Helpers, as: Routes
  alias PokeTools.MakeUpAMon.RandomMon

  @impl Phoenix.LiveView
  def mount(params, session, socket) do
    IO.inspect(socket.assigns)

    case connected?(socket) do
      true ->
        connected_mount(params, session, socket)

      false ->
        {:ok,
         assign(socket,
           loading: true,
           tweet_link: "#",
           daily_route: Routes.make_up_a_mon_index_path(socket, :daily),
           random_route: Routes.make_up_a_mon_index_path(socket, :random)
         )}
    end
  end

  defp connected_mount(_params, _session, socket) do
    random_mon =
      if socket.assigns.live_action == :daily,
        do: RandomMon.generate_daily(),
        else: RandomMon.generate()

    {
      :ok,
      socket
      |> assign(random_mon: random_mon)
      |> assign(loading: false)
      |> assign(daily_route: Routes.make_up_a_mon_index_path(socket, :daily))
      |> assign(random_route: Routes.make_up_a_mon_index_path(socket, :random))
    }
  end

  @impl Phoenix.LiveView
  def handle_params(_params, url, socket) do
    random_mon = Map.get(socket.assigns, :random_mon, nil)

    {:noreply,
     assign(socket, current_url: url, tweet_link: create_tweet_link(random_mon, socket.assigns.live_action, url))}
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="flex flex-col w-screen items-center">
      <div class="flex flex-col w-full max-w-[1920px] items-center">
        <.nav live_action={@live_action} daily_route={@daily_route} random_route={@random_route} />
        <.buttons tweet_link={@tweet_link} />
        <%= if @loading do %>
          <.loading_cards live_action={@live_action} />
        <% else %>
          <%= if @live_action == :daily do %>
            <.card label="Date">
              <div class="flex justify-center">
                <%= @random_mon.created_at |> Calendar.strftime("%B %-d, %Y") %>
              </div>
            </.card>
          <% end %>
          <.card label="Type">
            <div class="flex flex-row justify-around">
              <div>
                <%= capitalize_type(@random_mon.type1) %>
              </div>
              <%= if @random_mon.type2 do %>
                <div>
                  <%= capitalize_type(@random_mon.type2) %>
                </div>
              <% end %>
            </div>
          </.card>
          <.list label="Base Design" list={@random_mon.base_designs} />
          <.list label="Random Related Words" list={@random_mon.descriptors} />
          <.list label="Related Concepts" list={@random_mon.extra_concepts} />
          <.list label="Found In" list={@random_mon.found_in} />
          <div class="flex flex-col w-full items-center lg:flex-row lg:w-3/4 lg:justify-between">
            <.boolean label="Is it a Legendary?" boolean={@random_mon.is_legendary} class="lg:mr-4" />
            <.boolean label="Does it have a Mega Evolution?" boolean={@random_mon.has_mega_evolution} />
          </div>
          <div class="flex flex-col w-full items-center lg:flex-row lg:w-3/4 lg:justify-between">
            <.boolean label="Can it Gigantamax?" boolean={@random_mon.has_gigantamax} class="lg:mr-4" />
            <.boolean label="Does it have an alternate form?" boolean={@random_mon.has_alternate_form} />
          </div>
          <.list label="Stats" list={@random_mon.stat_descriptions} vertical={true} />
        <% end %>
      </div>
    </div>
    """
  end

  def list(assigns) do
    assigns =
      assigns
      |> assign_new(:vertical, fn -> false end)
      |> assign_new(:label, fn -> nil end)
      |> assign_new(:class, fn -> "" end)

    ~H"""
    <.card label={@label} class={@class}>
      <ul class={
        "flex #{if @vertical, do: "flex-col", else: "flex-col mb-2 lg:flex-row lg:justify-between lg:items-stretch lg:mb-0"}"
      }>
        <%= for item <- @list do %>
          <li class={"w-full #{if @vertical, do: "text-left mb-2", else: "text-center"}"}>
            <%= item %>
          </li>
        <% end %>
      </ul>
    </.card>
    """
  end

  def boolean(assigns) do
    assigns =
      assigns
      |> assign_new(:label, fn -> nil end)
      |> assign_new(:class, fn -> "" end)

    ~H"""
    <.card label={@label} class={@class}>
      <%= if @boolean, do: "Yes", else: "No" %>
    </.card>
    """
  end

  def card(assigns) do
    assigns =
      assigns
      |> assign_new(:label, fn -> nil end)
      |> assign_new(:class, fn -> "" end)

    ~H"""
    <div class={"flex flex-col justify-left my-2 w-3/4 #{@class}"}>
      <div
        :if={@label}
        class="bg-zinc-600 text-white w-fit mx-4 lg:mx-2 p-1 pb-0 self-center lg:self-auto rounded-t-md shadow-md shadow-stone-400"
      >
        <div class="bg-zinc-700 rounded-t-sm px-1">
          <div class={
            "bg-zinc-800 rounded-t-sm pl-4 pr-4 py-1 min-w-[250px] text-white-500 text-center #{large_pixel_font()}"
          }>
            <%= @label %>
          </div>
        </div>
      </div>
      <div class="flex flex-col p-1 items-center bg-zinc-600 rounded-lg shadow-md shadow-stone-400">
        <div class="w-full pl-4 pr-12 rounded-md bg-red-400 border-2 border-red-300">
          <div class="w-full pl-2 pr-4 rounded-sm items-center bg-red-200">
            <div class="pr-2 rounded-sm items-center bg-red-100">
              <div class="flex flex-col w-full min-h-[68px] rounded-sm  items-center bg-white py-2 pb-4">
                <div class={"w-3/4 #{pixel_font()}"}>
                  <%= render_slot(@inner_block) %>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp nav(assigns) do
    ~H"""
    <nav class="flex flex-col items-center justify-center w-full my-4 font-sourcesans tracking-wide text-lg font-semibold">
      <div class="bg-zinc-600 text-white w-fit mt-4 mb-8 p-1 rounded-md shadow-md shadow-stone-400">
        <div class="bg-zinc-700 rounded-sm px-1">
          <div class={
            "flex flex-row items-center bg-zinc-800 rounded-t-sm px-8 py-1 w-50 text-white-500 text-center font-bold text-3xl #{large_pixel_font()}"
          }>
            Make Up a Mon
          </div>
        </div>
      </div>
      <ul class="flex flex-row justify-around w-1/2">
        <li>
          <div class="bg-zinc-600 text-white w-fit p-1 rounded-md shadow-md shadow-stone-400 mx-1 lg:mx-0">
            <div class="bg-zinc-700 rounded-sm px-1">
              <div class={
                "flex flex-row items-center bg-zinc-800 rounded-t-sm pl-2 pr-8 py-1 w-50 text-white-500 text-center #{large_pixel_font()} hover:text-red-500 #{if @live_action == :daily, do: "text-red-400", else: "text-white"}"
              }>
                <div class={"material-icons mr-2 #{if @live_action != :daily, do: "invisible"}"}>play_arrow</div>
                <a href={@daily_route} class="block lg:hidden">Daily</a>
                <a href={@daily_route} class="hidden lg:block">Daily Mon</a>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="bg-zinc-600 text-white w-fit p-1 rounded-md shadow-md shadow-stone-400 mx-1 lg:mx-0">
            <div class="bg-zinc-700 rounded-sm px-1">
              <div class={
                "flex flex-row items-center bg-zinc-800 rounded-t-sm pl-2 pr-8 py-1 w-50 text-white-500 text-center #{large_pixel_font()} hover:text-red-500 #{if @live_action == :random, do: "text-red-400", else: "text-white"}"
              }>
                <div class={"material-icons mr-2 #{if @live_action != :random, do: "invisible"}"}>play_arrow</div>
                <a href={@random_route} class="block lg:hidden">Random</a>
                <a href={@random_route} class="hidden lg:block">Random Mon</a>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </nav>
    """
  end

  defp buttons(assigns) do
    ~H"""
    <div class="flex flex-row w-60 justify-end fixed bottom-10 right-10 z-40">
      <button
        phx-click="generate_random"
        class="rounded-full w-20 h-20 mx-4 bg-zinc-800 shadow-md shadow-zinc-800 p-1 animate-none lg:hover:animate-wiggle lg:hover:shadow-lg lg:hover:shadow-zinc-800 lg:hover:z-50 duration-100"
      >
        <div class="flex items-center justify-center bg-zinc-700 rounded-full w-full h-full">
          <div class="material-icons text-6xl text-white">
            refresh
          </div>
        </div>
      </button>
      <a
        href={@tweet_link}
        target="_blank"
        class="rounded-full w-20 h-20 mx-4 flex flex-col justify-center items-center bg-zinc-800 shadow-md shadow-zinc-800 p-1 animate-wiggleonce lg:animate-none lg:hover:animate-wiggle lg:hover:shadow-lg lg:hover:shadow-zinc-800 lg:hover:z-50 duration-100"
      >
        <div class="flex items-center justify-center bg-red-400 rounded-t-full w-full h-1/2" />
        <div class="flex items-center justify-center bg-white rounded-b-full w-full h-1/2" />
        <div class="absolute material-icons text-6xl text-zinc-700">
          share
        </div>
      </a>
    </div>
    """
  end

  # old label
  # <div
  #   :if={@label}
  #   class={"bg-slate-500 text-white w-fit ml-2 p-1 pb-0 rounded-t-md shadow-md shadow-stone-400"}
  #   >
  #   <div class="bg-slate-300 rounded-sm p-1">
  #     <div class={"bg-white rounded-sm pl-2 pr-6 py-1 min-w-[210px] text-red-500 #{large_pixel_font()}"}>
  #       <%= @label %>
  #     </div>
  #   </div>
  # </div>

  defp loading_cards(assigns) do
    ~H"""
    <%= if @live_action == :daily do %>
      <.card label="Date" class="animate-pulse">
        <div class="flex flex-row justify-center">
          <div class="h-4 w-1/2 bg-slate-200 rounded mt-1"></div>
        </div>
      </.card>
    <% end %>
    <.card label="Type" class="animate-pulse">
      <div class="flex flex-row justify-center">
        <div class="h-4 w-1/2 bg-slate-200 rounded mt-1"></div>
      </div>
    </.card>
    <.card label="Base Design" class="animate-pulse">
      <div class="flex flex-row justify-center">
        <div class="h-4 w-1/2 bg-slate-200 rounded mt-1"></div>
      </div>
    </.card>
    <.card label="Random Related Words" class="animate-pulse">
      <div class="flex flex-row justify-center">
        <div class="h-4 w-1/2 bg-slate-200 rounded mt-1"></div>
      </div>
    </.card>
    <.card label="Related Concepts" class="animate-pulse">
      <div class="flex flex-row justify-center">
        <div class="h-4 w-1/2 bg-slate-200 rounded mt-1"></div>
      </div>
    </.card>
    <.card label="Found In" class="animate-pulse">
      <div class="flex flex-row justify-center">
        <div class="h-4 w-1/2 bg-slate-200 rounded mt-1"></div>
      </div>
    </.card>

    <div class="flex flex-row w-3/4 justify-between">
      <.card label="Is it a Legendary?" class="animate-pulse mr-4">
        <div class="flex flex-row justify-center">
          <div class="h-4 w-1/2 bg-slate-200 rounded mt-1"></div>
        </div>
      </.card>
      <.card label="Does it have a Mega Evolution?" class="animate-pulse">
        <div class="flex flex-row justify-center">
          <div class="h-4 w-1/2 bg-slate-200 rounded mt-1"></div>
        </div>
      </.card>
    </div>

    <div class="flex flex-row w-3/4 justify-between">
      <.card label="Can it Gigantamax?" class="animate-pulse mr-4">
        <div class="flex flex-row justify-center">
          <div class="h-4 w-1/2 bg-slate-200 rounded mt-1"></div>
        </div>
      </.card>
      <.card label="Does it have an alternate form?" class="animate-pulse">
        <div class="flex flex-row justify-center">
          <div class="h-4 w-1/2 bg-slate-200 rounded mt-1"></div>
        </div>
      </.card>
    </div>

    <.card label="Stats" class="animate-pulse h-50">
      <div class="flex flex-row justify-center">
        <div class="h-4 w-1/2 bg-slate-200 rounded mt-1"></div>
      </div>
    </.card>
    """
  end

  defp pixel_font, do: "font-sourcesans tracking-wide text-lg font-semibold"
  defp large_pixel_font, do: "font-sourcesans tracking-wider text-xl font-semibold"

  defp capitalize_type(type) do
    type
    |> Atom.to_string()
    |> String.capitalize()
  end

  defp create_tweet_link(nil, _, _), do: "#"

  defp create_tweet_link(random_mon, :daily, current_url) do
    month = random_mon.created_at |> Calendar.strftime("%B")
    month_num = random_mon.created_at |> Calendar.strftime("%m")
    day = random_mon.created_at |> Calendar.strftime("%-d")
    day_num = random_mon.created_at |> Calendar.strftime("%d")
    year = random_mon.created_at |> Calendar.strftime("%Y")
    base_design = random_mon.base_designs |> List.first()
    types = "#{capitalize_type(random_mon.type1)}#{if random_mon.type2, do: " / #{capitalize_type(random_mon.type2)}"}"

    ~s[https://twitter.com/intent/tweet?text=Make%20Up%20a%20Mon%20for%20#{month}%20#{day},%20#{year}!%0A--%20#{types}%20--%20#{base_design}%20--%0A&hashtags=MakeUpAMon,MUAM#{month_num}#{day_num}2023&url=#{current_url}]
  end

  defp create_tweet_link(random_mon, :random, current_url) do
    seed = random_mon.seed

    base_design =
      random_mon.base_designs
      |> Enum.take(3)
      |> Enum.join(" / ")

    types = "#{capitalize_type(random_mon.type1)}#{if random_mon.type2, do: " / #{capitalize_type(random_mon.type2)}"}"

    ~s[https://twitter.com/intent/tweet?text=Make%20Up%20a%20Mon!%0ASeed%20#{seed}%0A--%20#{types}%20--%0A--%20#{base_design}%20--%0A&hashtags=MakeUpAMon&url=#{current_url}]
  end

  @impl Phoenix.LiveView
  def handle_event("generate_random", _params, socket) do
    {:noreply, push_redirect(socket, to: Routes.make_up_a_mon_index_path(socket, :random))}
  end
end
