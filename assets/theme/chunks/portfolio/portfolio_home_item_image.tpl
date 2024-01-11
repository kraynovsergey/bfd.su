{set $image = 'pThumb' | snippet : [
    'input' => $image_home,
    'options' => 'w=592&h=592&zc=1&q=90&f=jpg'
]}

{set $image_2x = 'pThumb' | snippet : [
    'input' => $image_home,
    'options' => 'w=1184&h=1184&zc=1&q=90&f=jpg'
]}

{set $image_webp = 'pThumb' | snippet : [
    'input' => $image_home,
    'options' => 'w=592&h=592&zc=1&q=90&f=webp'
]}

{set $image_webp_2x = 'pThumb' | snippet : [
    'input' => $image_home,
    'options' => 'w=1184&h=1184&zc=1&q=90&f=webp'
]}

<picture class="home-cases__picture">
    <source type="image/webp" srcset="{$image_webp_2x} 2x, {$image_webp} 1x">
    <img src="{$image}" srcset="{$image_2x} 2x, {$image} 1x" alt="{$pagetitle | escape}" width="592" height="592">
</picture>