class ArticlesController <ApplicationController
   before_action :set_article, only: [:edit,:update,:show,:destroy]
   before_action :require_user, except:[:index,:show]
   before_action :require_same_user, only: [:edit,:update,:destroy]
    def new 
        @article=Article.new
    end
    def destroy
        
        
        @article.destroy
       
        
        flash[:danger]="The article was successfully destroyed"
        
         redirect_to articles_path
    end
    def edit
       
    end
    def update
        
        
        if @article.update(article_params)
            flash[:success]="Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    def index
        @articles=Article.paginate(page: params[:page],per_page: 5)
    end
    def show
        
          
    end
    def create
        @article=Article.new(article_params)
        @article.user=current_user
        #redirect_to articles_path(@article)
        if @article.save
            flash[:success]="Article was successfully saved"
            redirect_to article_path(@article)
        else
            render 'new'
        end
            
    end
   
    
   
    
    private 
      def article_params
            params.require(:article).permit(:title, :description)
      end
      
      def set_article
          @article=Article.find(params[:id])
      end
      
      def require_same_user
         if current_user!=@article.user
             flash[:danger]="You could only edit or delete your own article"
             
             redirect_to root_path
             
         end
      end
    
      
      
end
