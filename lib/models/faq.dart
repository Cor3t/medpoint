class FaqModel {
  final String title, content;
  FaqModel({required this.title, required this.content});
}

List<FaqModel> faqItems = [
  FaqModel(
      title: "How to register",
      content:
          "To register to medpoint, you have to have some informations to be stored online. This includes; \n1. Firstname \n2. lastname \n3. Email address \n4. Your Gender \n5. Your Age \n After the informations are provides, you click the register button to get started."),
  FaqModel(
      title: "How to login",
      content:
          "To login to medpoint, you have to provide the email address used to register and the password. The click login to get started."),
  FaqModel(
      title: "How to get an appointment",
      content:
          "To get an appointment in medpoint, have to login or register an account first. Once you are done with that, you can search for an appointment using the search textfield at the top of the homepage."),
  FaqModel(
      title: "How to search for doctors based on speciality",
      content:
          "To login to medpoint, you have to provide the email address used to register and the password. The click login to get started."),
  FaqModel(
      title: "Can I book an appointment twice?",
      content:
          "It is not possible to book an appointment for the sickness. But it is possible to book a different appointment for a different sickness"),
  FaqModel(
      title: "How to contact us",
      content:
          "To contact us, you can visit our website @ www.medpoint.com and have a chat with our customer service."),
];
