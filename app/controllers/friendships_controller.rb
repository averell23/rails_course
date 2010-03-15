class FriendshipsController < ApplicationController
  
  # POST /friendship
  # POST /friendship.xml
  def create
    @friendship = Friendship.new(params[:friendship])

    if(request.xhr?)
      @friendship.save
      @user = @friendship.user
      render :partial => 'users/friend_list', :object => @friendship.user.friends
    else

    respond_to do |format|
      if @friendship.save
        flash[:notice] = 'Added a new friend.'
        format.html { redirect_to(@friendship.user) }
        format.xml  { render :xml => @friendship, :status => :created, :location => @friendship }
      else
        flash[:notice] = 'This friend does not exist.'
        format.html { redirect_to(@friendship.user) }
        format.xml  { render :xml => @friendship.errors, :status => :unprocessable_entity }
      end
    end
  end
  end
end
