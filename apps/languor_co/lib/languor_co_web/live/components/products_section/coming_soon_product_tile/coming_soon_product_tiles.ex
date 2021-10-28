defmodule ComingSoonProductTiles do
  @moduledoc false

  use Surface.Component

  @doc "Number of default product tiles to show"
  prop(count, :integer, required: true)

  def render(assigns) do
    ~F"""
    {#for _index <- 1..@count}
      <div class="mx-auto product-margin">
        <div class="rounded-lg defaultProductBG defaultProductSize" data-scroll-animation="fade-up">
          <p class="relative text-lg text-center text-white sm:text-2xl top-3/4 header-text">Coming Soon!</p>
        </div>
      </div>
    {/for}
    """
  end
end

# 235 by 330       happens at greater than 624
# 135 bt 190
