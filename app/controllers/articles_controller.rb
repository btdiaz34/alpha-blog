class ArticlesController <ApplicationController
    def new 
        @article=Article.new
    end
    #def index
       # @articles=Article.all
   # end
    def show
          @article=Article.find(params[:id])
    end
    def create
        @article=Article.new(article_params)
        #redirect_to articles_path(@article)
        if @article.save
            flash[:notice]="Article was successfully saved"
            redirect_to article_path(@article)
        else
            render 'new'
        end
            
    end
   
    
   
    
    private 
      def article_params
            params.require(:article).permit(:title, :description)
      end
    
      
      
end
