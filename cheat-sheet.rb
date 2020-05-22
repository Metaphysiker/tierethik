rails g scaffold Post title:string description:text content:text

#breites Bild
rails g scaffold Post title:string description:text content:text --cover_display section

#Bild oben
rails g scaffold Page title:string description:text content:text --cover_display top

rails g add_cover Post

rails g tinymce Post

rails g tinymce Post --name_of_attribute content

<section class="page-cover-bg" style="background-image: url('<%%= url_cover %>'); height: <%%= height_of_cover %>px;">
    <div class="container d-flex align-items-start justify-content-center h-100 pt-2">

        <%%#= image_tag("logo_stinah_ws_vektor.png", class: "img-fluid mb-4 rounded overlay-darker", style: "height: 180px;") %>

    </div>
</section>
