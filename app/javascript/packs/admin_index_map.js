// ライブラリの読み込み
let map;
const postsData = $('#adminPostsData')
const posts = postsData.data('json')
let default_latitude = 38.04701
let default_longitude = 138.382362

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const {AdvancedMarkerElement} = await google.maps.importLibrary("marker")

  // 地図の中心と倍率は公式から変更
  map = new Map(document.getElementById("admin-index-map"), {
    center: { lat: default_latitude, lng: default_longitude },
    zoom: 5,
    mapId: "DEMO_MAP_ID",
    mapTypeControl: false
  });

  try {
    const response = await fetch("/admin/posts.json");
    if (!response.ok) throw new Error('Network response was not ok');

    const posts = await response.json();
    if (!Array.isArray(posts)) throw new Error("Posts is not an array");

    posts.forEach( post => {
      // 投稿に関する設定
      const latitude = post.latitude;
      const longitude = post.longitude;
      const spotName = post.name;
      // ユーザーに関する設定
      const userName = post.user_name;
      const address = post.address;
      const caption = post.caption;

      const marker = new google.maps.marker.AdvancedMarkerElement ({
        position: { lat: latitude, lng: longitude },
        map,
        title: spotName,
      });

      const contentString = `
        <div class="information container p-0" style="max-width: 300px;">
          <p class="text-muted"><i class="fa-solid fa-user"></i> ${userName}</p>
          <p class="text-muted"><i class="fa-solid fa-shop"></i> ${spotName}</p>
          <p class="text-muted"><i class="fa-solid fa-location-dot"></i> ${address}</p>
          <p class="text-muted"><i class="fa-solid fa-microphone-lines"></i> ${caption}</p>
        </div>
      `;

      const infowindow = new google.maps.InfoWindow({
        content: contentString,
        ariaLabel: spotName,
      });

      marker.addListener("click", () => {
          infowindow.open({
          anchor: marker,
          map,
        })
      });
    });
  } catch (error) {
    console.error('Error fetching or processing post:', error);
  }
}

initMap()
