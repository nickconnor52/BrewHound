--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: beer_beer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE beer_beer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: beer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE beer (
    beer_id integer DEFAULT nextval('beer_beer_id_seq'::regclass) NOT NULL,
    brewery_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    beer_type character varying(20) NOT NULL,
    abv real NOT NULL,
    ibu integer,
    glass_type character varying(30)
);


--
-- Name: brewery_brewery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE brewery_brewery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brewery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE brewery (
    brewery_id integer DEFAULT nextval('brewery_brewery_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    location_id integer NOT NULL,
    address character varying(200) NOT NULL,
    latitude real,
    longitude real,
    description text NOT NULL,
    year_founded integer NOT NULL,
    image_path character varying(30)
);


--
-- Name: location_location_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE location_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE location (
    location_id integer DEFAULT nextval('location_location_id_seq'::regclass) NOT NULL,
    city character varying(30) NOT NULL,
    state character varying(30) NOT NULL
);


--
-- Name: review_review_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE review_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: review; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE review (
    review_id integer DEFAULT nextval('review_review_id_seq'::regclass) NOT NULL,
    beer_id integer NOT NULL,
    user_id integer NOT NULL,
    description text NOT NULL,
    rating integer NOT NULL
);


--
-- Name: users_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    user_id integer DEFAULT nextval('users_users_id_seq'::regclass) NOT NULL,
    username character varying(30) NOT NULL,
    password character varying(80) NOT NULL,
    salt character varying(256) NOT NULL,
    role character varying(20) NOT NULL,
    email character varying(30),
    phone_number character varying(15),
    brewery_id integer
);


--
-- Data for Name: beer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY beer (beer_id, brewery_id, name, description, beer_type, abv, ibu, glass_type) FROM stdin;
1	1	Greens Keeper	Big citrus hop flavor that doesn't overpower, medium body, and a low ABV allow for prolonged enjoyment through even the longest of afternoons. This is an IPA that deserves a day off.	Session IPA	4.69999981	44	Nonic Pint
2	1	1862 Ale	In 1862, President Lincoln signed the Morrill Act into law, giving the American populous the opportunity to seek a higher education. It called for one great state university in each state, and inadvertently led to tailgate parties, marching bands, fight songs and Bowl Games. Our 1862 Ale –a dry-hopped American take on the classic German beer– combines the crisp clean flavor of German Noble hops with the floral aromatics of American hops.	American Kolsch	4.9000001	24	Stange
3	1	Stiff-Arm	Like a palm to your jaw, our American IPA delivers a jolt of hoppy goodness. An ale as well rounded as any All-Timer, our Stiff-Arm IPA combines all of its talents: All American hops, fragrant aromas of citrus and pine, a clean finish, and an uncanny sense of balance provided by a nice malt backing. It’s a classic American beer that will have you striking the pose year-round.	IPA	6.4000001	50	Nonic Pint
4	1	Glory	Brewed with Club and City in mind, Glory is an American Wheat Ale with Citra hops. Its final recipe was culled from two experimental taproom tastings with the passionate supporters of Columbus Crew SC. They chose this bright, hoppy, and refreshing wheat ale as their beer. Glory to Columbus, indeed.	American Wheat Ale	5.4000001	24	Nonic Pint
5	1	Son Of A Mudder	Nevermind the conditions. This Brown Ale’s father was a Mudder and his mother was a Mudder. A taproom favorite being released in cans for the first time. Son of a Mudder is a tried and true American Brown Ale with a subtle hop presence at the turn and toffee, caramel, and coffee notes waiting in the winner’s circle. When they’re calling for rain, dig in and grab a Mudder. It’s a sure thing.	American Brown Ale	6.0999999	27	Nonic Pint
6	1	Neutron	Before there was even a term “super fans” there was a man that could make an entire stadium stand up and take notice with a goofy dance breakdown. Grab your cap and let the sounds of the band and the roar of the crowd guide your moves. Packed with Chinook, ID7, Citra, Mosaic, Zythos, and Amarillo hops this Double IPA packs a juicy hop punch and deserves a standing ovation. $1.00 from each six pack sold will go to benefit the Neutron Man Memorial Fund.	Double IPA	8	90	Gobet
7	1	Goon	Goon is an assertive Strong American Pale Ale that scoffs at fruity hop trends and brings a dank and piney aggression to the ice. With Magnum, Northern Brewer, Chinook, and Green Bullet hops in tow, Goon lives up to its reputation as a hard hitter. Drop your gloves and take a swig.	Strong Pale ALe	6.0999999	65	Nonic Pint
8	1	One Goal One Ryed	One Goal, One Rye’d is brewed in support of cancer research. This Rye Pale Ale offers up a bit of spice from the malt that pairs nicely with notes of lemon and grapefruit. $1.00 from each six pack sold ­and $1.00 from each taproom pour goes directly toward Pelotonia’s goal of ending cancer once and for all.	Rye Pale Ale	5.9000001	39	Nonic Pint
9	1	Beard Crumbs	Beard Crumbs is a smooth dark stout teeming with notes of chocolate, coffee, and an extra punch of holiday cheer via the addition of carmelized raisins. It delivers the joy of an oatmeal raisin cookie, minus the crumbly clean up. It's a festive ale that old Saint Nick himself would love.	Oatmeal Raisin Stout	7.30000019	42	Belgian
10	2	CBC IPA	India Pale Ales were originally brewed to withstand long ocean voyages by increasing the quantity of hops and malt used in their Pale Ale predecessors. Our take on IPA pours pale orange with a balanced malt presence and finishes with a combination of grapefruit, pine, and tropical fruit notes from Pacific Northwest grown hops.	IPA	6.30000019	60	Nonic Pint
11	2	Thunderlips	This deep golden Pale Ale is brewed with Simpsons Golden Promise malt to create a backbone for thunderous additions of Mosaic® and Equinox® hops.	Experimental IPA	5.30000019	40	Nonic Pint
12	2	SFW	SFW is our version of a Belgian style farmhouse ale. This beer is brewed with wheat, oats, and fresh ground coriander. After years of experimenting, we believe that the fruit and spice character of our house Saison yeast combined with tropical notes from our favorite American hops deliver an unforgettable explosion of flavor.	Farmhouse Style Ale	4.69999981	24	Pint
13	2	Bodhi	An awakening of the senses by virtue of American hops. Pale golden in color, this double IPA showcases a unique blend of hops, highlighting the true nature of Citra®.	Double IPA	8.30000019	80	Nonic Pint
14	2	Creeper	Pale malts provide a stage for the huge hop presence. Creeper is our limited release Imperial IPA featuring an ever evolving blend of American hops.	Imperial IPA	10	100	Nonic Pint
15	2	Citra Noel	Welcome to a new holiday tradition. Our mahogany colored ale features tropical fruit notes from Citra® hops and has a deep rich malt character.	Hoppy Holiday Ale	7.30000019	34	Nonic Pint
16	2	Summer Teeth	Beer is meant to be shared and nothing says summer like sharing a crisp, golden lager with friends. This traditional German style lager is brewed with a blend of European malts and hops to create a refreshing, easy-drinking beer.	German Style Lager	5.30000019	18	Pint
17	2	Yakima Fresh	Our annual wet-hopped American IPA features hops that were shipped directly from the farm to our brewery and used within 24 hours after being picked in the field. This year’s batch (2017) was brewed with fresh Mosaic® hops from B.T. Loftus Ranches in Yakima, WA.	Wet Hop IPA	7.5	70	Nonic Pint
18	2	Lucy	Our Belgian style IPA is brewed with traditional Trappist ale yeast. This deceptively strong ale is hopped with a blend of new world hops to enhance the spicy aromatics from the Belgian yeast.	Belgian IPA	9	75	Pint
19	2	Festbier	Our Festbier is inspired by the Oktoberfest beers of Germany. It is brewed with imported specialty malts to create a medium bodied, malty, amber lager with a smooth finish.	Oktoberfest Lager	5.30000019	22	Pint
20	3	Seventh Son	Seven hops, aromatically hoppy, rich malts, jammy, not bitter, nutty	American Strong Ale	7.69999981	40	Nonic Pint
21	3	The Scientist	Constantly shifting IPA, each batch w/one ingredient changed from the last	IPA	7	75	Pint
22	3	Stone Fort	Inspired by traditional English browns, milk chocolate, faint sweet smoke	Oat Brown Ale	5	25	Pint
23	3	Humulus Nimbus	Berry-piney hops and light malts, toes the line between IPA and pale ale	Strong Pale Ale	6	53	Nonic Pint
24	3	Proliferous	Lots of resinous pine, very citrusy and tropical in the nose	Double IPA	8.30000019	85	Nonic Pint
25	3	Goo Goo Muck	Sour wort IPA and fruity, like citrus juice	Tart IPA	8	50	Goblet
26	3	Scorched Earth	Land Grant collab double IPA with agave nectar	Double IPA	8.19999981	95	Nonic Pint
27	3	Brother Jon	Easily drinkable with faint fruit and spice, crackery malt	Belgian Blonde Ale	6.30000019	30	Mug
28	3	Golden Ratio	Made with locally sourced honey- toasty malts, tropical fruit hops	IPA	7	68	Nonic Pint
29	3	Black Sheep	Dry hopped stout that is lightly smokey, char, chocolate, spicy hops	American Stout	6.5999999	22	Goblet
30	4	Hilltop Herritage Lager	Hilltop was inspired by our love of the classic American lager beer. From the recipe design and lagering techniques, to the can artwork and affordable price. Hilltop honors the tradition of a local beer for all beer drinkers.	Lager	4.19999981	13	Staright out of the can
31	4	Rectifier Double IPA	Our American double IPA is made with loads of dank, resinous American hops to create a bold mix of citrus, floral and tropical notes. An electrifying concoction for all of you hop heads.	IPA	8.10000038	84	Nonic Pint
32	4	Big Star White IPA	This Belgian White IPA is brewed with barley and wheat, containing a wonderful grapefruit citrus aroma and a peppery sweet finish. An IPA for everyone.	IPA	7	70	Pint
33	4	Vanilla Porter	Our winter seasonal American Porter made with Madagascar Vanilla Beans and a variety of specialty malts, smooth roasted flavor finishing dry with hints of chocolate and hoppy bitterness.	Porter	6	42	Goblet
34	4	Skeleton Red Rye IPA	This fall seasonal is a firmly bitter IPA, with piney and citrus aroma. Hint of rye flavor with a devilishly dry finish.	Rye Beer	6.65999985	66	Nonic Pint
35	4	Playback Pilsner	Our pilsner is an all-day drinker perfect for a rock festival weekend. This lager beer is brilliant with a gorgeous golden hue. We age it for nearly a month using a centuries old process to build a crisp, clean flavor that is perfectly balanced. The nose is bright with loads of herbal, cedar and floral hop aroma contributed by the finest hops the Bavarian Hallertauer region can yield.	Pilsner	5.0999999	45	Pint
36	4	Switchblade IPA	Explosive notes of ripe tropical fruit and citrus dominate the aroma, with savage amounts of hops used in both early and late additions. This dry-hopped American IPA will close out every show the way rock intendedguitar smashing and hoping for an encore.	American IPA	6.5	65	Pint
37	4	Suncaster Summer Wheat Ale	Our summer seasonal is a refreshing unfiltered wheat beer that finishes dry with a wonderful peach and passionfruit aroma.	Wheat ALe	5	28	Pint
38	4	Brass Knuckle Pale Ale	A hard-rocking Pale Ale that smacks the lips with tasty bitter hops and citrusy grapefruit shots to the nose. It finishes crisp and dry, sustaining like a windmill power chord. All of a sudden it hits you...this is the one.	Pale Ale	5.75	36	Pint
39	5	Punk IPA	Our scene-stealing flagship is an India Pale Ale that has become a byword for craft beer rebellion; synonymous with the insurgency against mass-produced, lowest common denominator beer. Punk IPA charges the barricades to fly its colours from the ramparts – full-on, full-flavour; at full-throttle. Layered with new world hops to create an explosion of tropical fruit and an all-out riot of grapefruit, pineapple and lychee before a spiky bitter finish, this is transatlantic fusion running at the fences of lost empires. Nothing will ever be the same again.	IPA	5.5999999	35	Nonic Pint
40	5	Dead Pony Club	Dead Pony is the invigorating surf that pounds the iridescent shoreline yards from the salt-encrusted asphalt of Route 1. The hop-heavy west-coast wonderland awaits. Dive in and the toasted malt base soon yields to a huge box-fresh hop hit, washing tropical fruit, floral garlands and spicy undertones all over your palate. Inspired by US-Style pale ales, Dead Pony is a low amplitude, high voltage hop hit; California dreaming for the craft beer generation.	Session Pale Ale	3.79999995	40	Nonic Pint
41	5	Jet Black Heart	Flaked oats and wheat add to the velvet mouth-feel, with the carbonation adding a honeycomb texture. Magnum and Sorachi Ace bring a berry & citrus fruitiness that amplifies the chocolate character of this inky leviathan.	Oatmeal Milk Stout	4.69999981	30	Goblet
42	5	Elvis Juice	An American IPA with a bitter edge that will push your citrus tolerance to the brink and back; Elvis Juice is loaded with tart pithy grapefruit peel.	Grapefruit IPA	6.5	40	Pint
43	6	Pale Ale	Easy drinking dry-hopped pale ale, showcasing aromas of tropical fruit, citrus and herbs. Drinks like a session IPA, but with the body to balance the hops.	Pale Ale	5.5	29	Pint
44	6	IPA	An American IPA with aggressive bitterness, floral and citrusy hop aromas balanced with a biscuity maltiness.	IPA	6.80000019	66	Nonic Pint
45	6	Milk Stout	Strong roasted malt character of this beer is supported by the creamy sweetness of lactose added during the kettle boil. Available as a nitrogenated keg, which pushes the smoothness of the finish to the next level.	Milk Stout	5.30000019	14	Pint
46	6	Hefeweizen	Our hefeweizen is a sessionable German wheat beer with light and refreshing hints of cloves and bananas. Historically, this style has been linked to summers in the biergarten, but our sells strongly all year long, regardless of the weather.	Hefeweizen	5.0999999	9	Pint
47	6	Honey Wheat Lager	Light body, orange hues and a smooth finish develop from brewing with a special honey malt and orange blossom honey.	Lager	5.80000019	28	Nonic Pint
48	6	Wildcard	A balanced and unique English ale aged with a kiss of vanilla beans. Available only as nitrogenated keg to pour creamy smooth in the English cask ale style.	English Ale	6.30000019	20	Pint
49	6	Jalalima	A super-fresh aroma of jalapeños is complimented by the tang of a splash of lime juice.	Jalapeno Ale	5.9000001	16	Pint
50	6	Grapefruit Walleye	The dank pungency of Citra hops is amplified by a hearty dose of grapefruit juice. The result is a blast of effervescent citrus tang.	Session IPA	4.69999981	48	Nonic Pint
51	6	Oktoberfest	Fun fact: The contents of three of these cans will fill a 1 liter beer stein very nicely.	Marzen	5.5999999	50	Stein
52	6	Tree Tapper	A nutty and toast brown ale brewed with Ohio-made maple syrup. Not too sweet but incredibly smooth.	Brown Ale	6.19999981	21	Pint
53	7	Clear Sky Daybreak	Just as the break of a new day ushers in endless possibilities, this provocative variant of our popular Clear Sky Cream Ale awakens new and intriguing tastes. We infuse our pre-prohibition styled ale with light roast beans from Columbus’ own One Line Coffee in addition to robust vanilla. What results is an aroma that defies convention and a flavor that opens up like the new morning.	Cream Ale	5	14	Nonic Pint
54	7	Driftwood	Our session IPA is truly that - a beer brewed with the express intent of enjoying several pints of Driftwood in a sitting and still feeling ready to attack a night out. We use as much late addition hops as in our normal IPA to maintain IPA levels of aroma and flavor while toning down the bitterness to allow for a balanced and drinkable beer. Hopped with Mosaic and Citra, Driftwood expresses bright notes of citrus, passion fruit, mango, and pineapple. This undoubted Wolf's Ridge employee favorite is sure to be one of yours, too.	Session IPA	4.5999999	50	Nonic Pint
55	7	Howling Moon	Some might call this beast a "Triple IPA" but we like to keep things simple. This Imperial IPA is loaded with the juiciest hops we can lay our hands on. The likes of El Dorado, Simcoe, and Galaxy lay it on thick with aromas of passion fruit, lychee, grapefruit, and lemon. We balance the bitterness with bready malts and strategic aroma hop additions throughout the process. Bold, crisp, assertive, and resinous.	Imperial IPA	10	90	Tulip
56	7	Dire Wolf	Canis Dirus, or "fearsome dog," is the scientific name for the Dire Wolf. One of the largest known breeds of wolf, the Dire Wolf went extinct at the end of the last ice age. Similarly, the Russian Imperial Stout was a beer style destined for extinction until craft brewers in America began to resurrect historical styles. Our Imperial Stout is named for the Dire Wolf because it is big, bold, and fearsome. Brewed with copious amounts of oats and brown sugar. Black as night with a dense tan head and chewy texture. Notes of dark chocolate, caramel, and espresso stand against a hefty bitterness to balance this monstrous beer.	Imperial Stout	10.3999996	50	Tulip
57	7	Clear Sky	The cream ale gained popularity pre-prohibition as American brewers tried to compete with the influx of German immigrants opening lager breweries. Similar to lagers in color, body, and complexity, the style is crisp and bready. The lower alcohol makes Clear Sky refreshing and sessionable. The typical addition of flaked maize is a nod to tradition and helps lighten the body while maintaining light body and smooth flavor. Perfect for session-drinking after a long day at work or warm afternoons on the banks of the Scioto.	Cream Ale	5	14	Pint
58	7	Earthrise IPA	Our IPA is laced with copious amounts of Azacca, Mandarina Bavaria, and Huell Melon hops. Juicy, dank, with a fruit forward nose.	IPA	7.4000001	85	Nonic Pint
59	7	Ridge Trail Pale Ale	Classic blend of American hops give a pungent juicy quality full of grapefruit and pine. Slightly malty finish with notes of caramel. Dry hopped with Centennial and Chinook.	Pale Ale	5.4000001	40	Nonic Pint
60	7	Snow Cone	Our Winter Pale Ale is brewed with Huell Melon hops and a half bale of whole cone Mosaic flowers.	Pale Ale	5.4000001	50	Nonic Pint
61	7	L'Abondance	Peppery Saison yeast meets floral, citrusy hops. Dry hopped to add a juicy character to this classic farmhouse style.	Saison	7.5	30	Tulip
62	7	Coconut Howling Moon	Our Howling Moon is bursting with bright tropical fruit and citrus hop aroma with a resinous, bitter hop bite. The addition of toasted coconut is the perfect compliment to our fruity Imperial IPA. The coconut provides depth of flavor and smooths over the bitterness to allow the sweet tropical notes to shine. Drink fresh because coconut and hop character will fade quickly.	Imperial IPA	10	90	Tulip
63	8	Magnon	This magnificent india pale ale is synchronized to collectively excite a fruity tropical hop and a dank herbaceous hop in the same magnetic moment. Propagate a spin wave in your mouth.	IPA	7.30000019	65	Nonic Pint
64	8	Luxon	This luxurious golden saison ale is gilded with the precious phenolics and esters of a saison yeast, yet within its luminous flux you’ll find an unusual clarity. Transmute a golden treasure into yourself.	Saison Ale	5.5999999	5	Pint
65	8	Fat Julian	This bittersweet imperial stout is reminiscent of leathery elephants dipped in dark chocolate. It barely fits in your mouth. Here’s to big, delicious challenges.	Imperial Stout	10	45	Goblet
66	8	Conductor	This harmonious imperial IPA is composed with precision and rye. Malts make early overtures, and experimental hops arrive right on time, conveying an elegant bitterness that promptly departs again.	Imperial Rye IPA	8.10000038	47	Pint
67	8	Thermal Conductor	This temperate habanero IPA couples bright fruity hops with piquant peppers to engineer a simmering heat that gradually builds up steam without blowing your stack. Hop aboard the rare pepper beer that conducts flavor as well as heat.	Habanero IPA	8.10000038	47	Nonic Pint
68	8	Curiosus	This curiously tart wheat beer was sour-mashed for 24 hours in pursuit of knowledge. The results remain unclear and sparkling. A virtuous weisse with a charming sour bite.	Berliner Weisse	5.19999981	5	Mug
69	8	Elektron	This crackling amber ale is charged with rye and Ohio-grown Cascade hops. The Greeks called amber “elektron” because they recognized its attractive potential. We hope our amber excites your particles, too.	Amber Rye	6.19999981	27	Pint
70	8	Orthodox	This hearty winter IPA resists the urge to spice it up. Roasty malts and musky hops take center stage in this salute to the traditionalist who believes beer shouldn’t taste like pie.	Winter IPA	6.9000001	44	Nonic Pint
71	8	Wiener-München	This jaunty fall festival lager is inspired by some of the world’s best parties: Oktoberfest and your own backyard. Vienna and Munich malts mingle with noble hops for a world class autumnal rumpus fresh from Columbus, Ohio.	Festival Lager	6.30000019	22	Mug
72	8	Eccentricity	This unusual french ale plots a bold trajectory. Its quirky character revolves around a distinctive biere de garde yeast and the subtle burn of fresh ginger and black pepper. We hope it pulls your mouth into our peculiar orbit.	French Ale	5.0999999	22	Tulip
73	9	Spaceship #6	Named after a Lineage grundy tank that shipped from the West coast, this American IPA is hopped with Mosaic, Simcoe, and Citra to build a complexity of tropical fruit flavors and aroma with a resiny finish.	American IPA	7.19999981	30	Nonic Pint
74	9	What the Helles is that Noise?	Did you hear that? Did anyone else hear a helicopter? What were those sirens? No idea, we were too busy drinking this delicious light European lager! Traditional Helles with a slight floral and grainy note. Super easy drinking and mega crushable.	Helles Lager	5.19999981	18	Stein
75	9	Kimmy Gibbler	This style originated in the San Francisco Bay area during the Gold Rush era. It is a refreshing easy drinking beer with a bready malt character and crisp American hops in the finish.	San Fransico Lager	5.4000001	30	Pint
76	9	Wholly Cran	Brewed in collaboration with Wholly Craft. This American Style wheat beer was brewed with orange peel and cranberries. Subtle cranberry flavor with hints of citrus and a nice bready finish.	Cranberry Wheat Ale	5.5999999	14	Pint
77	9	FestCbus	An ale you can really air your grievances to. This malty english style ale is brewed with a balance of orange peel, American citrusy hops, cinnamon and fresh grated ginger. FestCBus finishes smooth with hint of spice and graham cracker.	Christmas Ale	7.0999999	22	Pint
78	9	Higgins	Brewed using Pale malt from Haus Malt in Cleveland. This malt forward beer has nice smooth notes of toast and caramel. Subtle floral favors from a light touch of Willamette hops. It is one smooth drinking ale!	Hibiscus Belgian Wit	6	22	Nonic Pint
79	9	The Utah	A mild may might be lower in abv, but certainly not in flavor. Caramel, biscuit and just a hint of a chocolate note round out the glass. The Utah is the perfect choice when you want to have a few pints with friends but don’t want to feel full or sacrifice flavor.	English Mild	3.70000005	14	Pint
80	9	The Vintner	Traditional French style saison with a twist. We used Sauvignon Blanc grape juice and Hallertau Blanc hops to give this slightly spicy and dry saison a nice subtle fruity white wine-like flavor.	French Saison	7.5	22	Snifter
81	9	Clintonville Brew	Lineage and the Clintonville Farmer’s Market teamed up again this year to create this mint chocolate stout. Using real mint and loads of cocoa nibs give this beer a refreshing mint chocolate finish. A portion of the sale of every beer benefit the Clintonville Farmer’s Market.	Mint Chocolate Stout	6.69999981	30	Goblet
82	9	Oscura Obscura	We took our favorite stout recipe, made it more toasty, removed all roasted malt and added locally roasted coffee, organic cocoa nibs and a few vanilla beans to create a deliciously confusing, creamy chocolate and coffee forward blonde beer.	Nitro Blonde Stout	7.9000001	26	Stange
83	10	Oktoberfest	Oktoberfest isn’t just for Germans anymore. If you can’t make it to Munich to celebrate, why not celebrate it now with our deliciously satisfying 1810 Octoberfest Lager. Brewed as a traditional Märzen, rich amber in color, medium body, with a toasty sweet malt finish.	Märzen	5.9000001	21	Pint
84	10	Bar-Bar	Bar-Bar is an especially massive version of our Big Bad Barleywine Ale. It is a colossal and complex beer bursting with malt, the sweetness is balanced by hops, the higher gravity warms the soul. When aged in bourbon barrels for six months, it picks up aromas and flavors of toffee, caramel, vanilla, toasty oak and the nose of bourbon. A properly stored barleywine can be enjoyed years after originally bottled, gaining additonal complexity and nuance with the passage of time.	Barlywine Ale	12	24	Mug
85	10	Ghost Scorpian	The Bhut Jolokia, or Ghost Chile, and the Trinidad Scorpion Chile are the two hottest peppers on the planet, with both clocking in at well over 1 MILLION Scoville Heat Units! (More than 400 times hotter than a jalapeno!) By adding equal parts of these two powerhouse peppers to our classic German-style lager, we may have created ”The World’s Hottest Beer!” Can you handle the Ghost Scorpion Lager?!	German Lager	5	23	Nonic Pint
86	10	Big Vic	An amber colored beer with a medium hoppy taste and medium citrisy taste as well. Goes down fairly smooth and overall a good beer to consume. A little bit of hop and a little bit of citrus goes along in this beer.	Imperial IPA	8.60000038	65	Tulip
87	10	Horny Goat	Very dark in color. Foamy off white head. Aroma is sweet and malty, nice smell. Relatively fruity for a porter, a little fig is noticed also. Slight tastes of chocolate and vanilla round out its flavor.	American Porter	7.5	36	Goblet
88	10	Dark Horse	Dark, ruby-hued body; thick, foamy, dense head. Dark roasted grain aroma. Malt sweetness; bitter chocolate; molasses. Medium-heavy body; mostly sweet finish.	Lager	5.30000019	25	Pint
89	10	Bear Ass Pale Ale	A medium yellow, chill hazed pale ale with notes of lemon zest and citric bitterness. The The feel is bright and finishes clean and crisp	Pale Ale	6.5	52	Nonic Pint
90	10	Mogabi	This beer pours a hazy looking golden amber with a fluffy white head that laces. The nose is citrusy, wheaty, with a hint of lemongrass. The flavor is a nice mix of yeast and hops, a great balance blending for a unique beer. A lighter mouthfeel, a well balanced beer. Overall an enjoyable beer, good flavor, and easy drinker.	Pale Wheat Ale	5.5	46	Pint
91	10	Three Frogs	A little warm in the nose and a little sting in the finish to go with the west coast style hopping, honey oily hop character, and fizzy carbonation.	Triple IPA	8	78	Nonic Pint
92	10	Bleeding Buckeye	This beer pours out a nice light brown color. It smells of sweet grains and malts with a taste of hops at the end. Bold, rich, and refreshing	Strong Bitter	5.69999981	34	Pint
93	11	Rybörg	Rybörg is a beer built upon layers of malt complexity. Rich caramel, biscuit, West Coast Hops and spicy rye flavors all harmonize like the best Thin Lizzy or Iron Maiden riffs.	Farmhouse Ale	5.9000001	31	Pint
94	11	Musk Of The Minotaur	Follow your nose to the most righteous party of the year. Huge orange and grapefruit aromas alongside a generous helping of some of that unmistakable dank stank. A mouthwateringly crisp and refreshing hop bitterness drives this bad Oscar home.	IPA	7.19999981	70	Nonic Pint
95	11	Konkey Dong	Konkey Dong, now that's what I call a joystick. Fermented in Donkey Kong barrels and excessively dry hopped with Galaxy, Simcoe, and Dr. Rudi Hops. Brewed in collaboration with Arcade Super Awesome.	Imperial IPA	8	69	Pint
96	11	Thudstaff	Slap it up on the bar, bud! Smooth low tones of rich chocolate set the groove while staccato-speed punches of banana and coconut mark the beat. Cacao nibs and Belgian yeast walk down the palate and deliver you straight to the hook. To fail to drink this is to be a victim; a victim of your choice. Maybe partying will help.	Imperial Stout	8.30000019	43	Goblet
97	11	Saizzurp	Sip, sip, sippin' on some SaiZzurp. We made it rain with Amarillo, Citra, &amp; Sorachi Ace hops at flameout and then let the French Saison yeast knock the bottom out. When fermentation ends we add Yuzu juice for an electrifying effect to bring the trill.	Farmhouse Pale Ale	7	52	Nonic Pint
98	11	Roller Blabe	Slurp up the neon! One sniff and you'll be painted in animal print spandex and sporting a side pony tail and that's just the guys. Ready yourself for the taste of your fanny pack getting sucked into the tape deck. Bodaciously dry-hopped with the Dank n' Fruity combo of Mosiac, Simcoe, and Galaxy hops. Brewed under the watchful eye of AC Slater and Lisa Turtle, I mean John &amp; Cindy from The Daily Growler.	Imperial IPA	8	103	Pint
99	11	Dragonsaddle	The strong “herbal” aroma sends you back to freshmen year catching a ride  to school in your weird burnout neighbor’s ____(insert your fav. El Camino, IROC, Firebird) whilst being bombarded by the sounds of Van Halen (DLR era, none of that Sammy Hagar synthy love song bullshit). DANKSOME!	Triple IPA	11.5	63	Chalice
100	11	Mom Jeans	Ever wondered what your favorite stout would taste like if it was wearing silk pajamas? Well the wait is over, Mom Jeans was brewed with malted oats and lactose sugar to insure a creamy, sumptuous, saxually mouth coating flavor. Notes of malted milk chocolate &amp; coffee are delivered as smoothly as if Toto was jamming "Rosanna" in your mouth.	Milk Stout	8	49	Nonic Pint
101	11	Wangbar	"Wangbar" - A maneuver of the highest degree of difficulty on the competitive nude air guitar circuit. This oatmeal double ipa was made to be self-indulgent, instantly gratifying, and as subtle as  David Lee Roth in bunless chaps.	Oatmeal IPA	8.30000019	85	Goblet
102	11	Tub Life	Mmm, dat bubbly. Major Tropical fruit, citrus, and spice notes waft out of the glass in a combination whose intensity hasn't been matched since the Sax solo was pronounced dead in 1989. The use of Oats, wheat, &amp; rye make for a pillowy mouthfeel followed by a dry refreshing finish. Jacuzzi crushable! Oh yeah it was mercilessly Dry-Hopped with El Dorado Hops.	Farmhouse Pale Ale	5	22	Nonic Pint
103	12	Hazy Miss Daisy	Remember that One Night Stand (Batch 136) in December 2016? That tart juiciness created from the Mosaic and Amarillo hops? The light haze you see from the east coast style yeast? The nice bit of maltiness she has that is a signature in Zaftig's lineup? Hazy Miss Daisy was so exquisite, we just had to have her back.	NE IPA	7	47	Tulip
104	12	Juicy Lucy	Juicy Lucy is a lighter IPA made to become your everyday beer. This delicious IPA delivers a citrusy punch full of fruity flavors, namely papaya, apricot, and guava. This lovely lady was double dry hopped with Citra and Rakau hops.	IPA	7	58	Tulip
105	12	A-Crop Blacklight	This full-bodied stout features rich dark chocolate and roasted tones, balanced by caramel notes and mild bitterness from Centennial and Perle hops.	Stout	9	24	Tulip
106	12	Shadowed Mistress	This American Strong Ale is continuously hopped with Citra hops. This dark lady features a tropical juice blast with light hints of roasted malt for a deep, ultra-balanced drinking experience.	American Strong Ale	9	47	Tulip
107	12	Heavy Hearted Amber	A balanced beauty with notes of biscuit, caramel, toffee, and toast, with a slight hop bite.	Amber Ale	8	23	Pint
108	12	Bourbon Stout	Zaftig Bourbon Stout is our signature barrel aged beer. We make this stout with lots of chocolate, roasted flavors, and age it with some of the best American Bourbon Barrels, Four Roses. We then add vanilla beans to round out this classic ale. The combination of beer, bourbon, and vanilla will have you wondering when this beauty will come again!	Barrel Aged Stout	10	18	Goblet
109	12	3 Socks	Notes of pine and grapefruit balance caramel sweetness and a big malt backbone in this easy-drinking IPA.	IPA	10	67	Tulip
110	12	BamBalam	This seasonal favorite  flaked oats, locally roasted Crimson Cup Coffee, and Ghirardelli chocolate.	Breakfast Stout	10	21	Tulip
111	12	Hootspa Wheat	This beauty is hopped with Palisade, Centennial, Amarillo, and Goldings that gives this easy drinker a fruitiness your tongue won't forget.	Wheat Ale	7	17	Tulip
112	12	Too Cans	Too Cans Imperial IPA is what Zaftig's foundation was built on. The ridiculous amount of grain mixed with an absurd amount of Centennial, Columbus, and Cascade hops make for an amazingly balanced IPA that is not for the faint of heart.	Imperial Ipa	14	49	Tulip
113	13	New Cleveland Palesner	Crisp german malt body and refreshing noble hop finish.	Pilsner Pale Ale	5	23	Nonic Pint
114	13	Speed Merchant	American ipa brewed with wheat, bursting with tropical fruit and citrus.	White IPA	6.5999999	66	Nonic Pint
115	13	Project Series	Delicious pale ale brewed with different hops each season. el dorado (jan-mar) / idaho #7 (apr-jun) / dr. rudi (jul-sep) / loral (oct-dec).	Pale Ale	5.0999999	40	Pint
116	13	Yammy Yammy	Roasted sweet potatoes with a touch of cinnamon, ginger, nutmeg, and clove.	Yam Beer	7.69999981	16	Tulip
117	13	Buckeye Blitz	Made exclusively with barley, wheat and oats grown and malted in the state of Ohio from Haus Malts and cascade hops from Second Sons in Canton. This double-dryhopped pale ale bursts with aromas of pine and clementines with a light and refreshing body.	Pale Ale	6	36	Pint
118	13	Esther	Honey, dark cherries, and a hint of toffee as the glass warms.	Christmas Ale	9.5	34	Goblet
119	13	High River	Bourbon Barrel Aged Stout in Tom's Foolery Barrels.	Stout	10.1999998	54	Tulip
120	13	Cherry Donut Pie	We worked with our friends at Brewnuts to collaborate on Cherry Donut Pie; a Pastry approach to one of our favorite styles. This Gose skirts a balance between sweetness and tart. Flavors of sweet cherry and pie crust with a mild salinity compliment a brite tartness, luscious cherry filling and biscuity, doughy nose.	Sour Gose	4.19999981	4	Tulip
121	13	Shanghai Noon	Prickly pear and Lychee sour with a bright floral nose and sweet earthy finish.	Sour Gose	4.19999981	5	Tulip
122	13	Cocoa Suave	Mexican Chocolate Milk Stout silky smooth body, cinnamon, red chiles, cocoa nibs added for truly a everything but the kitchen sink beer.	Stout	5.5	20	Pint
123	1	Test Brew	This guy is heavy	IPA	14.1000004	110	Nonic Point
\.


--
-- Name: beer_beer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('beer_beer_id_seq', 123, true);


--
-- Data for Name: brewery; Type: TABLE DATA; Schema: public; Owner: -
--

COPY brewery (brewery_id, name, location_id, address, latitude, longitude, description, year_founded, image_path) FROM stdin;
2	CBC	1	2555 Harrison Road, Columbus, Ohio 43204	39.9666748	-83.0703506	Columbus Brewing Company is an independent craft brewery dedicated to exploring the flavors of American hops. Best known for Columbus IPA and Bodhi, we also enjoy the subtleties of German-style lagers, the intense characteristics of barrel aged beers and everything in between.	1988	CBC.jpg
3	Seventh Son	1	1101 N 4th St, Columbus, OH 43201	39.9853745	-82.9992905	SEVENTH SON BREWING HAS BEEN PRODUCING EXCEPTIONAL BEERS AT THE INTERSECTION OF 4TH & 4TH IN COLUMBUS' HISTORIC ITALIAN VILLAGE SINCE APRIL OF 2013.	2013	SeventhSon.jpg
4	Four String	1	985 W 6th Ave, Columbus, OH 43212	39.9890022	-83.0327682	Rock 'n' roll craft brewery featuring a taproom with pints to drink on-site & growlers to-go.	2011	FourString.jpg
5	Brew Dog	1	96 Gender Rd, Canal Winchester, OH 43110	39.8473892	-82.8261566	BrewDog is a multinational brewery and pub chain based in Ellon, Scotland	2007	Brewdog.jpg
6	North High	1	1288 N High St, Columbus, OH 43201	39.9887581	-83.0055923	North High Brewing creates small-batch, high-quality craft beer that they serve in their taproom as well as on tap at dozens of area restaurants and bars.	2011	NorthHigh.jpg
7	Wolfs Ridge	1	215 N 4th St, Columbus, OH 43201	39.9672775	-82.997612	Every single WRB beer is born from the creativity and imagination of a passionate and dedicated team, headed by Chris Davison. We strive to produce high quality and consistent beers across a wide spectrum of styles.	2013	WolfsRidge.jpg
8	Actual Brewing	1	655 N. James Rd, Columbus, OH 43219	39.9868927	-82.9081345	A first-rate brewery and beverage laboratory doing delicious beer science in a dodgy warehouse by the airport.	2013	Actual.jpg
9	Lineage	1	2971 N. High St, Columbus, OH 43202	40.0225716	-83.0141373	Lineage Brewing® pays homage to the tradition of craft beer by expanding upon age-old techniques with new flavor combinations that would make our ancestors proud.	2013	Lineage.jpg
10	Elevator	1	165 N. 4th St, Columbus, Ohio 43215	39.9662247	-82.9973907	Founded in 1999 by a father/son beer drinking team in a small-town grain elevator, we are now into our second century of brewing award-winning beer with as much passion as you put into enjoying each pint.	1999	Elevator.jpg
11	Hoof Hearted	1	850 N. 4th St, Columbus, OH 43215	39.9804459	-82.998085	Dabbling in the Dank and Dark arts since 2011, Ol’ HoofyMan’s got that hot-pot kettle that won’t ever settle. Slurp up some serious neon by way of one of our many fruity and full-bodied IPA’s. Learn eternal secrets from unknown elders after inhaling a double-mash stout. Whatever you choose, just make sure you ask your mom if it’s cool to come over.	2011	Hoof.jpg
12	Zaftig	1	7020A Huntley Rd, Columbus, OH 43229	40.1060028	-82.9976044	We aim to produce every beer to the standards of our favorite beers from the breweries we admire.  With that, we've coined our motto, full bodied ales.	2014	Zaftig.jpg
13	Platform	1	408 N 6th St, Columbus, OH 43215	39.9717293	-82.9927597	Sprawling industrial-chic taproom serving a rotating selection of craft beer & local eats.	2014	Platform.jpg
1	Land Mount Caramel	1	424 W Town St, Columbus, OH 43215	39.9580307	-83.0114746	Land-Grant was born from a passion for painstakingly-crafted beer, powerful design, and a midwestern sports devotion.	2014	LandGrant.jpg
\.


--
-- Name: brewery_brewery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('brewery_brewery_id_seq', 13, true);


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: -
--

COPY location (location_id, city, state) FROM stdin;
1	Columbus	Ohio
\.


--
-- Name: location_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('location_location_id_seq', 1, true);


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: -
--

COPY review (review_id, beer_id, user_id, description, rating) FROM stdin;
1	1	1	Greens Keeper is the perfect beer for a "relaxing" day on the links. 	5
2	22	1	An excellent beer with a smooth finish. 	5
3	9	1	I've had better, I've had worse. 	3
4	1	1	Greens Keeper is the quintessential columbus ale. 	5
5	18	1	Tastes like it was brewed in a shoe factory. 	1
6	47	2	Test	1
7	4	3	It's fantastic	5
\.


--
-- Name: review_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('review_review_id_seq', 7, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (user_id, username, password, salt, role, email, phone_number, brewery_id) FROM stdin;
1	admin_user	Bal7qQtyU79XYve/C7lf0A==	ZkVP3KEjfpznjZ+WLVXweu3phBV78525bAhWF7CdVTna6ENfCQvX3msRKyIKg54f2sTOsQngWIS1WvGVZMH0PajYkggPN5/ze1HXguivvP6zKRkoHiGtp+2hMbqYzc/LJi0x5W9CO4f71JmzXJU22tak4h4jZDWKBZmTtRK8xHU=	admin	\N	\N	\N
2	test_user	5ms9o+tC3A4TIC/oH095rw==	rUuxqv27ZSJ7iUQdEdKOS5ajP6V/WD7QqDcUY+8PLhk9E934M0pCA6mdt3EELobICdWH6JlJ5wsfsDBf/lm7TvfI84RS3AdvEVewVTIhmjCucmwsbnkOPpyoCzAT5nID023i7qIASrSflyJ+IU3vUL65/UiSaZCiFJ5xrx+/WZQ=	user	\N	\N	\N
3	brewer_user	UTjzWGxAWwGK3ih8Tb7PLg==	BfucpcQ/WbSvXxAMkkENGqEETBo8qSn4YaOZgfcqIpZXuD06tn1sV5nUIYCFSPP5B/Fn0ZO1M1igfFnvSVxKOUoLia5uVEGKyucD8miEi+trTOM+5ntvlHyVq8bBwze6YTMDeXQfkcKJ0IKpJ0A22y1PZhjUlSsNrWx++uNSp9U=	brewer	\N	\N	1
4	testuser1	68alizJYMHpZg1Nb64D6nA==	ChOt3he1KFJIrA9Ut+Kjz8sjUWujoNtcS/ljUlFFPHz95jwbClujyOgP373JQ/9BEO1J+97AAjHafdVQeXbGpSNIpA786ZcZY3u/j+YxSJYzKpiARSluRIWO1ocZS+dDATayU3Dugyb/hLlINf0ejE65uYku6tM4PCrT39md4NU=	user	\N	\N	\N
\.


--
-- Name: users_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_users_id_seq', 4, true);


--
-- Name: beer pk_beer_beer_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY beer
    ADD CONSTRAINT pk_beer_beer_id PRIMARY KEY (beer_id);


--
-- Name: brewery pk_brewery_brewery_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY brewery
    ADD CONSTRAINT pk_brewery_brewery_id PRIMARY KEY (brewery_id);


--
-- Name: location pk_location_location_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY location
    ADD CONSTRAINT pk_location_location_id PRIMARY KEY (location_id);


--
-- Name: review pk_review_review_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY review
    ADD CONSTRAINT pk_review_review_id PRIMARY KEY (review_id);


--
-- Name: users pk_users_users_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT pk_users_users_id PRIMARY KEY (user_id);


--
-- Name: beer fk_beer_brewery; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY beer
    ADD CONSTRAINT fk_beer_brewery FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id);


--
-- Name: brewery fk_brewery_location; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY brewery
    ADD CONSTRAINT fk_brewery_location FOREIGN KEY (location_id) REFERENCES location(location_id);


--
-- Name: review fk_review_beer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY review
    ADD CONSTRAINT fk_review_beer FOREIGN KEY (beer_id) REFERENCES beer(beer_id);


--
-- Name: review fk_review_users; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY review
    ADD CONSTRAINT fk_review_users FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: users fk_users_brewery; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_users_brewery FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id);


--
-- PostgreSQL database dump complete
--

