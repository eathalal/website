class Permission
  
  def initialize(current_user)
    
    # global
    allow :posts, [:index, :show]
    # allow :categories, [:index, :show]
    #allow :contacts, [:new, :create]

    # guests
    if current_user.nil?
      allow 'devise/sessions', [:new, :create]
      allow 'devise/registrations', [:new, :create]
      allow 'devise/confirmations', [:new, :show]
      allow 'devise/passwords', [:new, :create, :edit, :update]
      #allow :password_resets, [:new, :create, :edit, :update]
    elsif current_user.admin?
     allow_all
    else
      allow 'devise/sessions', [:destroy]
      #allow :users,    [:show, :edit, :update] do |user|
       # user.id == current_user.id
      #end
      #allow :email_validates, [:create, :edit, :update] unless current_user.email_valid?
      # supports
      #allow :supports, [:index]
    end 
  end

  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end

  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

  def allow_all
    @allow_all = true
  end  
end