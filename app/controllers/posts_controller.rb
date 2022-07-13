class PostsController < ApplicationController
  layout "application"
   def index
    @posts = Post.all
    @title = "スケジュール一覧"
  end

   def show
    @post = Post.find(params[:id])
    @title = "スケジュール詳細"
   end

  def add
    @post = Post.new
    @title = "スケジュール新規登録"
  end

  def create
    @post = Post.new(post_param)
    if @post.save then
      flash[:notice] = "スケジュールを新規登録しました" 
      goback
    else
      flash[:alert] = "スケジュールの更新ができませんでした"
      re = ""
      @post.errors.messages.each do |key,vals|
        vals.each do |val|
          re += "<span style='color:red'>" + val + "</span>" + "<br>"
        end
      end
      @msg = re.html_safe
      render "add"
    end
  end

  def edit
    @title = "スケジュール編集"
    @post = Post.find(params[:id])
    if request.patch? then
      @post.update(post_param)
      if @post.save then
        flash[:notice] = "ID:" + @post.id.to_s + "のスケジュールを更新しました" 
        goback
      else 
        flash[:alert] = "スケジュールの更新ができませんでした"
        re = ""
        @post.errors.messages.each do |key,vals|
           vals.each do |val|
             re += "<span style='color:red'>" + val + "</span>" + "<br>"
          end
        end
        @msg = re.html_safe
        render "edit"
      end
    end
  end

  def delete
    deleteItem = Post.find(params[:id])
    flash[:alert] = "ID:"+ deleteItem.id.to_s +  "のスケジュールを削除しました"
    deleteItem.destroy
    redirect_to "/posts"
  end

  private
  def post_param
    params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo)
  end

  def goback
    redirect_to "/posts"
  end
    
end

