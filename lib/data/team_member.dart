import 'dart:convert';

const teamMembers = <TeamMember>[
  TeamMember(
    name: "Sarp",
    role: "Co-Founder & CEO",
    linkedIn: "sarpcetinyurt",
    twitter: "Deuxmachina007",
    imagePath: "assets/png/person_sarp.png",
    location: "Manchester, UK",
    description:
        "Hey everybody, my name is Sarp Cetinyurt, the Co-Owner of Rejuvenate Finance. I have 5 years of experience at financial+political advising. I have lived in Toronto, Canada for my high-school studies and specialised in advanced level economics. After finishing my studies in there I moved to the UK to study international economics at the University of Manchester. Some of the companies I worked with before are Deloitte, and Alvarez & Marsal. I usually find myself taking charge and being the one others count on for direction. I highly enjoy teaching others and helping them grow. I naturally assume the risk of leadership, and I am known to excite others to reach their goals(Which I am super excited to help you all with).",
  ),
  TeamMember(
    name: "Kevin",
    role: "Co-Founder & CTO",
    twitter: "i_like_cubes",
    linkedIn: "kevin-scheeren-622b191ba",
    github: "kevinscheeren",
    imagePath: "assets/png/person_kevin.png",
    location: "Aachen, GER",
    description:
        "Hey everyone, my name is Kevin Scheeren. I am studying Applied Maths & Computer Science at the RWTH Aachen / FH Aachen in combination with an apprenticeship. Throughout this journey I worked in a few companies in CV/AR Development - nonetheless I have broad knowledge in a variety of technologies and do my best to keep learning and building every single day.",
  ),
  TeamMember(
    name: "Kazi",
    role: "Co-Founder & CMO",
    twitter: "TheCryptoKazi",
    linkedIn: "isa-kazi-751a87229",
    imagePath: "assets/png/person_isa.png",
    location: "Birmingham, UK",
    description:
        "My name is Isa Kazi, Co-Owner of Rejuvenate Finance! I am an 18 year old entrepreneur, and the founder and owner of Crypto Goats, and other successful businesses. I have a passion for success, and strive to be the best. Crypto is my key focus area, and I have enjoyment teaching and guiding people around me. My actions speak for my words",
  ),
  TeamMember(
    name: "Rey",
    role: "Strategic Advisor",
    twitter: "King_Diego21",
    imagePath: "assets/png/person_rey.png",
    linkedIn: "rey-santiago-233744150",
    description:
        '''Hi guys, my name is Rey Santiago, aka King Diego. I am part of the marketing team here at Rejuvenate Finance. I have an extensive background in sales and marketing. I’ve been part of a few early startups, including one that became a nine-figure company. I enjoy connecting with people on social media, especially Twitter, chatting about crypto and giving advice, (although not financial advice, of course).''',
  ),
  TeamMember(
    name: "Chris",
    role: "Marketing Advisor",
    imagePath: "assets/png/person_chris.png",
    description:
        "Hi, I am Chris Warburton. I own multiple businesses and specialise in marketing and scaling of businesses. I regard myself as an entrepreneur and I’m hugely excited to be able to bring my expertise & skills that I’ve learnt and evolved in business, to Rejuvenate Finance.",
  ),
];

class TeamMember {
  final String name;
  final String role;
  final String description;
  final String? location;
  final String? imagePath;
  final String? twitter;
  final String? linkedIn;
  final String? github;
  const TeamMember({
    required this.name,
    required this.role,
    required this.description,
    this.location,
    this.imagePath,
    this.twitter,
    this.linkedIn,
    this.github,
  });

  TeamMember copyWith({
    String? name,
    String? role,
    String? description,
    String? location,
    String? imagePath,
    String? twitter,
    String? linkedIn,
    String? github,
  }) {
    return TeamMember(
      name: name ?? this.name,
      role: role ?? this.role,
      description: description ?? this.description,
      location: location ?? this.location,
      imagePath: imagePath ?? this.imagePath,
      twitter: twitter ?? this.twitter,
      linkedIn: linkedIn ?? this.linkedIn,
      github: github ?? this.github,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'role': role});
    result.addAll({'description': description});
    if (location != null) {
      result.addAll({'location': location});
    }
    if (imagePath != null) {
      result.addAll({'imagePath': imagePath});
    }
    if (twitter != null) {
      result.addAll({'twitter': twitter});
    }
    if (linkedIn != null) {
      result.addAll({'linkedIn': linkedIn});
    }
    if (github != null) {
      result.addAll({'github': github});
    }

    return result;
  }

  factory TeamMember.fromMap(Map<String, dynamic> map) {
    return TeamMember(
      name: map['name'] ?? '',
      role: map['role'] ?? '',
      description: map['description'] ?? '',
      location: map['location'],
      imagePath: map['imagePath'],
      twitter: map['twitter'],
      linkedIn: map['linkedIn'],
      github: map['github'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamMember.fromJson(String source) =>
      TeamMember.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TeamMember(name: $name, role: $role, description: $description, location: $location, imagePath: $imagePath, twitter: $twitter, linkedIn: $linkedIn, github: $github)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TeamMember &&
        other.name == name &&
        other.role == role &&
        other.description == description &&
        other.location == location &&
        other.imagePath == imagePath &&
        other.twitter == twitter &&
        other.linkedIn == linkedIn &&
        other.github == github;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        role.hashCode ^
        description.hashCode ^
        location.hashCode ^
        imagePath.hashCode ^
        twitter.hashCode ^
        linkedIn.hashCode ^
        github.hashCode;
  }
}
