// ブートストラップ ローダ
(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.Maps_API_Key
});

// ライブラリの読み込み
let map;
const postsData = $('#postsData')
const posts = postsData.data('json')
let default_latitude = 35.681236
let default_longitude = 139.767125
if (posts.length >= 1) {
  const index = posts.length - 1
  const default_post = posts[index]
  default_latitude = default_post.latitude
  default_longitude = default_post.longitude
} 
console.log(default_latitude)
console.log(default_longitude)

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const {AdvancedMarkerElement} = await google.maps.importLibrary("marker")

  // 地図の中心と倍率は公式から変更
  map = new Map(document.getElementById("map"), {
    center: { lat: default_latitude, lng: default_longitude },
    zoom: 15,
    mapId: "DEMO_MAP_ID",
    mapTypeControl: false
  });

  try {
    //const response = await fetch("/posts.json");
    //if (!response.ok) throw new Error('Network response was not ok');
    //const { data: { posts } } = await response.json();
    //const posts = await response.json();
    //if (!Array.isArray(posts)) throw new Error("Posts is not an array");

    posts.forEach( post => {
      console.log(post)
      // 投稿に関する設定
      const latitude = post.latitude;
      const longitude = post.longitude;
      const spotName = post.name;
      // ユーザーに関する設定
      //const userImage = post.user.image;
      const userName = post.user_name;
      const address = post.address;
      const caption = post.caption;
      const marker = new google.maps.marker.AdvancedMarkerElement ({
        position: { lat: latitude, lng: longitude },
        map,
        title: spotName,
      });

      const contentString = `
        <div class="information container p-0">
          <div class="mb-3 d-flex align-items-center">
            <!--<img class="rounded-circle mr-2" src="{userImage}" width="40" height="40">-->
            <p class="lead m-0 font-weight-bold">${userName}</p>
          </div>
          <div>
            <h1 class="h4 font-weight-bold">${spotName}</h1>
            <p class="text-muted">${address}</p>
            <p class="lead">${caption}</p>
          </div>
        </div>
      `;

      const infowindow = new google.maps.InfoWindow({
        content: contentString,
        //ariaLabel: spotName,
      });

      marker.addListener("click", () => {
          console.log('hello')
          infowindow.open(map, marker);
      });
    });
  } catch (error) {
  console.error('Error fetching or processing post images:', error);
  }
}

initMap()
