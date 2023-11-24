export class Resume {
  // Attributes
  id: number = 0;
  firstName: string = '';
  lastName: string = '';
  email: string = '';
  phone: string = '';
  address: string = '';
  academicBackground: string = '';
  professionalExperience: string = '';
  skills: string = '';
  languages: string = '';
  certifications: string = '';

  constructor(
    id: number,
    firstName: string,
    lastName: string,
    email: string,
    phone: string,
    address: string,
    academicBackground: string,
    professionalExperience: string,
    skills: string,
    languages: string,
    certifications: string
  ) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.phone = phone;
    this.address = address;
    this.academicBackground = academicBackground;
    this.professionalExperience = professionalExperience;
    this.skills = skills;
    this.languages = languages;
    this.certifications = certifications;
  }
}
