import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoard {
  final String image, title, description;
  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> demo_data = [
  OnBoard(
      image: "assets/images/solar.jpeg",
      title: 'Solar System',
      description:
          r'''Our solar system consists of our star, the Sun, and everything bound to it by gravity – the planets Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, and Neptune; dwarf planets such as Pluto; dozens of moons; and millions of asteroids, comets, and meteoroids. Beyond our own solar system, we have discovered thousands of planetary systems orbiting other stars in the Milky Way.'''),
  OnBoard(
      image: "assets/images/mercury.png",
      title: 'Mercury',
      description:
          r'''Mercury is the first planet from the Sun and the smallest planet in the Solar System. It is a terrestrial planet with a heavily cratered surface due to the planet having no geological activity and an extremely tenuous atmosphere.'''),
  OnBoard(
      image: "assets/images/venus.png",
      title: 'Venus',
      description:
          r'''Venus is the second planet from the Sun. It is a rocky planet with the densest atmosphere of all the rocky bodies in the Solar System, and the only one with a mass and size that is close to that of its orbital neighbour Earth'''),
  OnBoard(
      image: "assets/images/earth.jpg",
      title: 'Earth',
      description:
          r'''Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being a water world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth's water is contained in its global ocean, covering 70.8% of Earth's surface'''),
  OnBoard(
      image: "assets/images/mars.jpg",
      title: 'Mars',
      description:
          r'''Mars is the fourth planet and the furthest terrestrial planet from the Sun. The reddish color of its surface is due to finely grained iron(III) oxide dust in the soil, giving it the nickname "the Red Planet". Mars's radius is second smallest among the planets in the Solar System at 3,389.5 km'''),
  OnBoard(
      image: "assets/images/jupitor.png",
      title: 'Jupitor',
      description:
          r'''Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun.'''),
  OnBoard(
      image: "assets/images/saturn.jpg",
      title: 'Saturn',
      description:
          r'''Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine-and-a-half times that of Earth. It has only one-eighth the average density of Earth, but is over 95 times more massive.'''),
  OnBoard(
      image: "assets/images/uranus.png",
      title: 'Uranus',
      description:
          r'''Uranus is the seventh planet from the Sun and is a gaseous cyan ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which in astronomy is called 'ice' or volatiles.'''),
  OnBoard(
      image: "assets/images/neptune.png",
      title: 'Neptune',
      description:
          r'''Neptune is the eighth planet from the Sun and the farthest IAU-recognized planet in the Solar System. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than its near-twin Uranus.'''),
];

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Image.asset(
            image,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 1,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
