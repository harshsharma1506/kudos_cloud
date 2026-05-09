# kudos_cloud
Demo for HCL colleagues  - for AI enabled development &amp; abapGIT
------------------------------
## 🏆 SAP Team Kudos App (RAP-based)
A modern, cloud-ready SAP application built using the ABAP RESTful Application Programming Model (RAP). This app allows team members to send "Kudos" to each other, fostering a culture of appreciation.
## 🚀 AI-Driven Development: GitHub Copilot + MCP
This project demonstrates a high-velocity development workflow using Generative AI and the Model Context Protocol (MCP).
## How the MCP Server for SAP Documentation was utilized:
The MCP server acted as a specialized knowledge bridge, providing GitHub Copilot with real-time access to the latest SAP documentation and development standards.

* Syntax Correction: When the initial draft failed to save data, the MCP server identified the missing mapping for block and the requirement for numbering : managed in the Behavior Definition (BDEF).
* Compliance Checks: It ensured the code adhered to strict(2) mode, which is the SAP best practice for modern RAP applications to ensure future-proof extensibility.
* Annotation Guidance: MCP provided the exact @Semantics and @UI annotations needed to enable automatic timestamping and a rich Fiori Elements user experience without manual UI coding.
* Boilerplate to Logic: It helped transition from simple CDS views to a functional Draft-enabled application by correctly placing draft actions and determinations.

------------------------------
## 🛠 Features

* abapGit Ready: Entirely serialized for easy distribution.
* Managed RAP BO: Handles the full CRUD lifecycle with minimal custom coding.
* Draft Support: Progress is automatically saved, allowing users to resume later.
* Status & Criticality: Visual indicators in the UI based on the Kudos status.
* Custom Actions: Includes an ApproveKudo action to demonstrate business logic extension.

------------------------------
## 💻 Tech Stack

* ABAP 7.5x+ / ABAP Cloud
* RAP Framework (Managed Implementation)
* OData V4 via Service Bindings
* Development Tools: ADT, GitHub Copilot, MCP Server for SAP.

------------------------------
## 📥 Installation via abapGit
You can easily pull this project into your SAP system:

   1. Open ABAP Development Tools (ADT).
   2. Open the abapGit Repositories view.
   3. Click the + icon to link a new repository.
   4. Enter the URL of this GitHub repository.
   5. Create a new package (e.g., ZTEAM_KUDOS) and click Pull.
   6. Activate all objects in the following order:
   * Database Table (zteam_kudos)
      * Data Definition (ZI_TeamKudos_R)
      * Behavior Definition
      * Service Definition & Service Binding
   
------------------------------
## 📄 Code Highlights
The core logic utilizes a managed implementation with explicit field mapping to bridge the technical database layer with the user-friendly UI layer:

mapping for zteam_kudos
{
  Uuid         = uuid;
  SenderName   = sender;
  ReceiverName = receiver;
  Message      = message;
  Status       = status;
  CreatedAt    = created_at;
}

------------------------------
## Sources

BTP trial can be taken from: 
* https://www.sap.com/products/technology-platform/trial.html

MCP server used is hosted at: 
* https://github.com/marianfoo/mcp-sap-docs

Update the ADT tools from:
* https://tools.hana.ondemand.com/

ABAPgit can be taken from:
* https://developers.sap.com/tutorials/abap-install-abapgit-plugin..html

Github Copilot can be installed as a plugin: 
* https://marketplace.eclipse.org/content/github-copilot

------------------------------

Screenshots: 
<img width="1906" height="652" alt="image" src="https://github.com/user-attachments/assets/38b51347-4bfb-48b5-844f-f78fd4cab5b4" />

------------------------------
<img width="660" height="600" alt="image" src="https://github.com/user-attachments/assets/77ebecef-ae71-4057-8878-e3ac795b4033" />

------------------------------
Main CDS 

<img width="1883" height="307" alt="image" src="https://github.com/user-attachments/assets/a9016c7a-50e8-4b22-9403-9f7c746a6428" />

------------------------------
Draft Table 

<img width="1919" height="296" alt="image" src="https://github.com/user-attachments/assets/7bcf6297-cc6a-4bfd-b537-f7a6f35c0d12" />


