module ArticlesHelper
    def article_params
        params.require(:article).permit(:title, :author, :school, :body)
    end
end
