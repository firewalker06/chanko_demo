module IsBiggerMeansBetter
  include Chanko::Unit

  # ## active_if
  # This block is used to decide if this unit is active or not.
  # `context` is the receiver object of `invoke`.
  # `options` is passed via `invoke(:foo, :bar, :active_if_options => { ... })`.
  # By default, this is set as `active_if { true }`.
  #
  # ```
  active_if do |context, options|
    Time.now.to_i.modulo(2).zero? 
  end
  # ```

  # ## raise_error
  # `raise_error` is used to force an unit to raise up errors occured in invoking.
  # You can force to raise up errors also by `Config.raise_error`.
  #
  # ```
  # raise_error
  # ```

  # ## function
  # In controller or view context, you can call functions defined by `function`
  # via `invoke(:is_bigger_means_better, :function_name)`.
  #
  # ```
  scope(:controller) do
    function(:index) do
      render "/index"
    end
  end
  # ```

  # ## render
  # In addition, the view path "app/units/is_bigger_means_better/views" is added into view_paths.
  # So you can render app/units/is_bigger_means_better/views/_example.html.erb in invoking.
  #
  # ```
  # scope(:view) do
  #   function(:function_name) do
  #     render "/example", :foo => "bar"
  #   end
  # end
  # ```

  # ## models
  # In models block, you can expand model features by `expand` method.
  # The expanded methods are available via unit proxy like `User.unit.active`,
  # and `User.find(params[:id]).unit.active?`, and so on.
  #
  # ```
  # models do
  #   expand(:User) do
  #     scope :active, lambda { where(:deleted_at => nil) }
  #
  #     def active?
  #       deleted_at.nil?
  #     end
  #   end
  # end
  # ```

  # ## shared
  # You can call methods defined by `shared` in invoking.
  #
  # ```
  # shared(:hello) do |world|
  #   "Hello, #{world}"
  # end
  # ```

  # ## helpers
  # You can call helpers in view via unit proxy like `unit.helper_method`
  #
  # ```
  # helpers do
  #   def helper_method
  #     "helper method"
  #   end
  # end
  # ```
end
