class ArticlesController < ApplicationController

  #############################################################################
  # Common Order for methods: index, show, new, edit, create, update, destroy #
  #############################################################################

  # In der Action "index" werden alle Referenzen auf die Einträge gespeichert und an den View index übermittelt.

  def index
    @articles = Article.all
  end

  # Die Action "show" wird durch das redirect innerhalb der action "create" aufgerufen. In eine Instanzvariable wird
  # die Referenz auf einen bestimmten Wert (id) gespeichert und an den View show übergeben

  def show
    @article = Article.find(params[:id])
  end

  # Wenn die url localhost:3000/articles/new aufgerufen wird wird die action "new" ausgeführt
  # Action "new" hat keine weitere Logik, ruft aber den view "new.html.erb" auf

  def new

  end

  # Sobald innerhalb des Formulars "new.html.erb" der Submit-Button gedrückt wird wird automatisch (weil submit)
  # eine POST-Methode aufgerufen in Rails wird dadurch die action "create aufgerufen."
  # In "create" werden die Paramater aus dem Formular in die Datenbank gespeichert

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  private

  # Eine der Rails Sicherheitsmaßnahmen sind sogenannte "Strong.Parameters" -> es muss Rails exakt gesagt werden
  # welche Parameter in der Action erlaubt sind. (Dies ist der Fall in der Action "create")
  # Um dieses System weiter vor äußeren Zugriffen abzusichern (und eine Wiederverwendung von Code zu erleichtern)
  # können die Parameter in eine private function ausgelagert werden.

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
